class VolunteerManager

  attr_accessor :errors, :rt_volunteer_subscribe, :request_form, :volunteer

  def initialize(args = {})
    @rt_volunteer_subscribe_id = args[:rt_volunteer_subscribe_id]
    @volunteer_attributes = args[:volunteer_attributes] || {}
    @errors = []
  end

  def valid?
    add_request_form_no_longer_exists_error if creation_through_request_form? && request_form.blank?
    errors.blank?
  end

  def build_volunteer(volunteer_attrs = nil)
    Volunteer.new(volunteer_attrs || rt_volunteer_subscribe.try(:volunteer_attributes) || {})
  end

  def creation_through_request_form?
    @rt_volunteer_subscribe_id.present?
  end

  def create_volunteer(options)
    self.volunteer = build_volunteer(@volunteer_attributes)
    ActiveRecord::Base.transaction do
      if volunteer.save
        assign_user_to_volunteer
        approve_request_form(options[:manager_id]) if creation_through_request_form?
      end
    end
    volunteer.persisted?
  end

  def rt_volunteer_subscribe
    @rt_volunteer_subscribe ||= Rt::VolunteerSubscribe.find_by(id: @rt_volunteer_subscribe_id.to_i)
  end

  def request_form
    @request_form ||= rt_volunteer_subscribe.try(:request_form)
  end

  def assign_user_to_volunteer
    user = User.new(login: "user#{'%09d' % volunteer.id}",
                    loggable: volunteer,
                    notice_type: NoticeType.email.take)
    # TODO Remove this line after removing email column from users
    user.email = "#{user.login}@voluntario_por_madrid.es"

    # User creation must be ensured after volunteer creation
    user.save(validate: false)
    user
  end

  def approve_request_form(manager_id)
    request_form.update_and_trace_status!(:approved, manager_id: manager_id, user_id: volunteer.user.id)
  end

  private

  def add_request_form_no_longer_exists_error
    errors << I18n.t('errors.request_form_no_longer_exists', request_type: Rt::VolunteerSubscribe.model_name.human)
    nil
  end

end