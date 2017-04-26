class EntitiesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= Entity.ransack_default
    @search_q = @entities.search(params[:q])
    @search_q.sorts ||= 'id asc'
    @unpaginated_entities = @search_q.result.uniq
    @entities = @unpaginated_entities.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@unpaginated_entities) do |format|
      format.csv { send_data Entity.to_csv(@unpaginated_entities), filename: "#{Entity.model_name.human(count: 2)}.csv" }
    end
  end

  def show
    respond_with(@entity) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @entity = Entity.new
    respond_with(@entity)
  end

  def edit
  end

  def create
    @entity.save
    create_and_assign_user_to_entity!(@entity, params[:entity_notice_type])
    assign_subscribe_date!(@entity)
    register_ent_subs_tracking!(@entity)
    respond_with(@entity)
  end

  def update
    previously_inactive = !@entity.active
    @entity.update_attributes(entity_params)
    create_and_assign_user_to_entity!(@entity, params[:entity_notice_type])
    if params[:entity][:unsubscribed_at].present?
      register_ent_unsubs_tracking!(@entity)
    elsif params[:entity][:unsubscribed_at].nil? && previously_inactive
      register_ent_subs_tracking!(@entity)
      assign_subscribe_date!(@entity)
      unassign_unsubscribe_date!(@entity)
    end
    respond_with(@entity)
  end

  def destroy
    @entity.destroy
    assign_unsubscribe_date!(@entity)
    register_ent_unsubs_tracking!(@entity)
    respond_with(@entity)
  end

  def recover
    @entity.recover
    unassign_unsubscribe_date!(@entity)
    register_ent_subs_tracking!(@entity)
    respond_with(@entity, notice: t('messages.succesfully_recovered'))
  end

  protected

    def entity_params
      params
        .require(:entity)
        .permit(
          :name,
          :description,
          :vat_number,
          :email,
          :representative_name,
          :representative_last_name,
          :representative_last_name_alt,
          :contact_name,
          :contact_last_name,
          :contact_last_name_alt,
          :phone_number,
          :phone_number_alt,
          :publish_pictures,
          :annual_survey,
          :req_reason_id,
          :entity_type_id,
          :comments,
          :other_subscribe_reason,
          :active,
          :subscribed_at,
          :unsubscribed_at,
          {
            address_attributes: [
              :id,
              :road_type,
              :road_name,
              :road_number_type,
              :road_number,
              :grader,
              :stairs,
              :floor,
              :door,
              :postal_code,
              :borough,
              :district,
              :town,
              :province,
              :country,
              :normalize,
              :_destroy
            ]
          },
          {
            projects_attributes: [
              :id,
              :active
            ]
          },
          {
            logo_attributes: [
              :id,
              :link_type_id,
              :file,
              :_destroy
            ]
          },
          {
            images_attributes: [
              :id,
              :link_type_id,
              :file,
              :_destroy
            ]
          },
          {
            videos_attributes: [
              :id,
              :link_type_id,
              :file,
              :_destroy
            ]
          },
          {
            docs_attributes: [
              :id,
              :link_type_id,
              :file,
              :_destroy
            ]
          },
          {
            urls_attributes: [
              :id,
              :path,
              :link_type_id,
              :file,
              :_destroy
            ]
          },
        )
    end

    private

    def create_and_assign_user_to_entity!(entity, notice_type_id_param)
      ActiveRecord::Base.transaction do
        notice = NoticeType.kinds_i18n.key(notice_type_id_param)
        puts "notice: #{notice}"
        if User.find_by(loggable_type: "Entity", loggable_id: entity.id).nil?
          user = User.new(login: "userentity#{'%09d'}#{entity.name}", loggable: entity)
          user.password = Digest::SHA1.hexdigest("#{entity.created_at.to_s}--#{user.login}")[0,8]
          user.password_confirmation = user.password
          user.email = "#{user.login}.entity@volun.es"
          if notice.present?
            user.notice_type_id = NoticeType.find_by(description: notice).try(:id) if notice_type_id_param.present?
          else
            user.notice_type_id = nil
          end
          copy_errors_from!(user) unless user.save
        else
          user = User.find_by(loggable_type: "Entity", loggable_id: entity.id)
          if notice.present?
            user.notice_type_id = NoticeType.find_by(description: notice).try(:id) if notice_type_id_param.present?
          else
            user.notice_type_id = nil
          end
          copy_errors_from!(user) unless user.save
        end
      end
    end

    def register_ent_subs_tracking!(entity)
      default_attrs = {
        entity:        entity,
        manager_id:    current_user.loggable_id,
        tracking_type: TrackingType.get_volunteer_subscribe,
        comments:      I18n.t('trackings.volunteer_subscribe'),
        tracked_at:    DateTime.now,
        automatic:     true,
      }
      ActiveRecord::Base.transaction do
        tracking = Ent::Tracking.new(default_attrs)
        copy_errors_from!(tracking) unless tracking.save
      end
    end

    def register_ent_unsubs_tracking!(entity)
      default_attrs = {
        entity:        entity,
        manager_id:    current_user.loggable_id,
        tracking_type: TrackingType.get_volunteer_unsubscribe,
        comments:      I18n.t('trackings.volunteer_unsubscribe'),
        tracked_at:    DateTime.now,
        automatic:     true,
      }
      ActiveRecord::Base.transaction do
        tracking = Ent::Tracking.new(default_attrs)
        copy_errors_from!(tracking) unless tracking.save
      end
    end

    def assign_subscribe_date!(entity)
      ActiveRecord::Base.transaction do
        entity.subscribed_at = Time.now
        copy_errors_from!(entity) unless entity.save
      end
    end

    def assign_unsubscribe_date!(entity)
      ActiveRecord::Base.transaction do
        entity.unsubscribed_at = Time.now
        copy_errors_from!(entity) unless entity.save
      end
    end

    def unassign_unsubscribe_date!(entity)
      ActiveRecord::Base.transaction do
        entity.unsubscribed_at = nil
        copy_errors_from!(entity) unless entity.save
      end
    end

    def copy_errors_from(record)
      self.errors += record.errors.full_messages
      nil
    end
  
    def copy_errors_from!(record)
      copy_errors_from(record)
      raise ActiveRecord::Rollback
    end

end
