class EntitiesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= Entity.ransack_default
    @search_q = @entities.search(params[:q])
    @entities = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@entities) do |format|
      format.csv { send_data @entities.to_csv }
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
    respond_with(@entity)
  end

  def update
    @entity.update_attributes(entity_params)
    create_and_assign_user_to_entity!(@entity, params[:entity_notice_type])
    respond_with(@entity)
  end

  def destroy
    @entity.destroy
    respond_with(@entity)
  end

  def recover
    @entity.recover
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

    def create_and_assign_user_to_entity!(entity, notice_type_id_param)
      if User.find_by(loggable_type: "Entity", loggable_id: entity.id).nil?
        user = User.new(login: "user#{'%09d' % entity.id}", loggable: entity, notice_type: NoticeType.find_by(description: notice_type_id_param))
        user.password = Digest::SHA1.hexdigest("#{entity.created_at.to_s}--#{user.login}")[0,8]
        user.password_confirmation = user.password
        user.email = "#{user.login}@volun.es"
        user.save
      else
        user = User.find_by(loggable_type: "Entity", loggable_id: entity.id)
        user.notice_type_id = NoticeType.find_by(description: notice_type_id_param).id
        user.save
      end
    end
end
