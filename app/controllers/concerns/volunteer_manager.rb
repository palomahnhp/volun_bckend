class VolunteerManager

  attr_accessor :errors, :rt_volunteer_subscribe, :request_form, :volunteer

  def initialize(options = {})
    @rt_volunteer_subscribe_id   = options[:rt_volunteer_subscribe_id]
    @rt_volunteer_unsubscribe_id = options[:rt_volunteer_unsubscribe_id]
    @volunteer_attributes        = options[:volunteer_attributes] || {}
    @volunteer                   = options[:volunteer]
    @manager_id                  = options[:manager_id]
    @errors                      = []
  end

  def valid?
    add_request_form_no_longer_exists_error if creation_through_request_form? && request_form.blank?
    errors.blank?
  end

  def build_volunteer(volunteer_attrs = nil)
    Volunteer.new(volunteer_attrs || rt_volunteer_subscribe.try(:volunteer_attributes) || {})
  end
  
  def upd_volunteer(volunteer, volunteer_attrs = nil)
    volunteer.update_attributes(volunteer_attrs || rt_volunteer_unsubscribe.try(:volunteer_attributes) || {})
  end

  def creation_through_request_form?
    @rt_volunteer_subscribe_id.present?
  end
  
  def update_through_request_form?
    @rt_volunteer_unsubscribe_id.present?
  end

  def create_volunteer
    return unless valid?

    self.volunteer = build_volunteer(@volunteer_attributes.merge manager_id: @manager_id)
    ActiveRecord::Base.transaction do
      if volunteer.save
        assign_user_to_volunteer!
        register_tracking!(
          tracking_type: TrackingType.get_volunteer_subscribe,
          comments:      I18n.t('trackings.volunteer_subscribe')
        )
        approve_request_form! if creation_through_request_form?
      else
        copy_errors_from!(volunteer)
      end
    end
    errors.blank?
  end
  
  def update_volunteer
    return unless valid?

    ActiveRecord::Base.transaction do
      old_project_ids = volunteer.project_ids
      if volunteer.update_attributes(@volunteer_attributes)
        new_project_ids     = volunteer.project_ids
        removed_project_ids = old_project_ids - new_project_ids
        added_project_ids   = new_project_ids - old_project_ids
        removed_project_ids.each do |project_id|
          register_tracking!(
            project_id:    project_id,
            tracking_type: TrackingType.get_project_unsubscribe,
            comments:      I18n.t('trackings.unsubscribe_from_project')
          )
        end
        added_project_ids.each do |project_id|
          register_tracking!(
            project_id:    project_id,
            tracking_type: TrackingType.get_project_subscribe,
            comments:      I18n.t('trackings.subscribe_to_project')
          )
        end
        approve_request_form! if update_through_request_form?
      else
        copy_errors_from!(volunteer)
      end
    end
    errors.blank?
  end

  def register_destroy_volunteer
    ActiveRecord::Base.transaction do
      register_tracking!(
        tracking_type: TrackingType.get_volunteer_unsubscribe,
        comments:      I18n.t('trackings.volunteer_unsubscribe')
      )
    end

    errors.blank?
  end
  
  def register_unsubscribe(attributes = {})
    ActiveRecord::Base.transaction do
      register_tracking!(attributes)
    end
  end

  def register_tracking!(attributes = {})
    default_attrs = {
      volunteer:    volunteer,
      request_form: request_form,
      manager_id:   @manager_id,
      tracked_at:   DateTime.now,
      automatic:    true,
    }
    tracking = Volun::Tracking.new(default_attrs.merge attributes)
    copy_errors_from!(tracking) unless tracking.save
    tracking
  end

  def rt_volunteer_subscribe
    @rt_volunteer_subscribe ||= Rt::VolunteerSubscribe.find_by(id: @rt_volunteer_subscribe_id.to_i)
  end
  
  def rt_volunteer_unsubscribe
    @rt_volunteer_unsubscribe ||= Rt::VolunteerUnsubscribe.find_by(id: @rt_volunteer_unsubscribe_id.to_i)
  end

  def request_form
    @request_form ||= if rt_volunteer_subscribe.present?
                        rt_volunteer_subscribe.try(:request_form)
                      elsif rt_volunteer_unsubscribe.present?
                        rt_volunteer_unsubscribe.try(:request_form)
                      end
  end

  def assign_user_to_volunteer!
    user = User.new(login: "uservolunteer#{'%09d' % volunteer.id}", loggable: volunteer, notice_type: NoticeType.email.take)
    user.password = generate_new_password(user)
    user.password_confirmation = user.password
    # TODO Remove this line after removing email column from users
    user.email = "#{user.login}.volunteer@volun.es"
    copy_errors_from!(user) unless user.save
    user
  end

  def approve_request_form!
    unless request_form.update_and_trace_status(:approved, manager_id: @manager_id, user_id: volunteer.user.id)
      copy_errors_from!(request_form)
    end
  end

  def respond_with_volunteer?
    return true if volunteer.errors.present?
    if rt_volunteer_subscribe
      volunteer.persisted?
    elsif rt_volunteer_subscribe
      volunteer.updated_at_changed?
    else
      true
    end
  end

  private

  def add_request_form_no_longer_exists_error
    errors << I18n.t('errors.request_form_no_longer_exists', request_type: Rt::VolunteerSubscribe.model_name.human)
    nil
  end

  def copy_errors_from(record)
    self.errors += record.errors.full_messages
    nil
  end

  def copy_errors_from!(record)
    copy_errors_from(record)
    raise ActiveRecord::Rollback
  end

  def generate_new_password(user)
    Digest::SHA1.hexdigest("#{volunteer.created_at.to_s}--#{user.login}")[0,8]
  end

end