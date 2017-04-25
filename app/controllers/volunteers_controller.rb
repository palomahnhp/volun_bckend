class VolunteersController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Volunteer.ransack_default
    @search_q = @volunteers.search(params[:q])
    @search_q.sorts ||= 'updated_at desc'
    @unpaginated_volunteers = @search_q.result.uniq.with_status(params[:status])
    @volunteers = @unpaginated_volunteers.paginate(page: params[:page], per_page: params[:per_page]||15)

    @districts_names = Address.joins(:volunteers).where.not(district: [nil, ""]).all.pluck(:district).uniq.sort_by { |district| district }

    @degreeSearch = Degree.filter_by_degree_type_id(params[:dt_id])
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @degreeSearch.to_json }
      format.csv  { render text: Volunteer.to_csv(@unpaginated_volunteers), filename: "#{Volunteer.model_name.human(count: 2)}.csv" }
    end
  end

  def show
    respond_with(@volunteer) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    volunteer_manager = VolunteerManager.new(rt_volunteer_subscribe_id: params[:rt_volunteer_subscribe_id])
    if volunteer_manager.valid?
      respond_with(@volunteer = volunteer_manager.build_volunteer)
    else
      redirect_to rt_volunteer_subscribes_path, alert: volunteer_manager.errors.to_sentence
    end
  end

  def edit
  end

  def create
    volunteer_manager = VolunteerManager.new(rt_volunteer_subscribe_id: params[:rt_volunteer_subscribe_id],
                                             volunteer_attributes: volunteer_params,
                                             manager_id: current_user.loggable_id)
    volunteer_manager.create_volunteer
    if volunteer_manager.respond_with_volunteer?
      respond_with(@volunteer = volunteer_manager.volunteer)
    else
      redirect_to rt_volunteer_subscribes_path, alert: volunteer_manager.errors.to_sentence
    end
  end

  def update
    volunteer_manager = VolunteerManager.new(rt_volunteer_unsubscribe_id: params[:rt_volunteer_unsubscribe_id],
                                             volunteer: @volunteer,
                                             volunteer_attributes: volunteer_params,
                                             manager_id: current_user.loggable_id)
    volunteer_manager.update_volunteer
    if volunteer_manager.respond_with_volunteer?
      respond_with(@volunteer = volunteer_manager.volunteer)
    else
      redirect_to rt_volunteer_unsubscribes_path, alert: volunteer_manager.errors.to_sentence
    end
  end

  def destroy
    @volunteer.destroy
    volunteer_manager = VolunteerManager.new(volunteer: @volunteer, manager_id: current_user.loggable_id)
    volunteer_manager.register_destroy_volunteer
    respond_with(@volunteer)
  end

  def recover
    @volunteer.recover
    respond_with(@volunteer)
  end

  def show_sms
    @volunteer = Volunteer.find_by(id: params[:volunteer])
    @sms_number = @volunteer.mobile_number
    if @sms_number
      respond_with(@volunteer) do |format|
        format.js { render 'shared/popup' }
        format.html
      end
    else
      render js: "swal( '#{t('alert_title')}','#{t('alert_message_phone')}','error')"
    end
  end

  def send_sms
    @volunteer = Volunteer.find_by(id: params[:volunteer])
    sms_number =  @volunteer.mobile_number
    begin
      SMSApi.new.sms_deliver(sms_number, params[:message])
      redirect_to volunteers_path, notice: I18n.t('success_message_sending')
    rescue
      redirect_to volunteers_path, alert: I18n.t('alert_message_sending')
    end
  end

  protected

    def volunteer_params
      params
        .require(:volunteer)
        .permit(
          :id,
          :name,
          :last_name,
          :last_name_alt,
          :id_number_type_id,
          :id_number,
          :gender,
          :birth_date,
          :nationality_id,
          :phone_number,
          :phone_number_alt,
          :email,
          :status_id,
          :employment_status_id,
          :vocne,
          :available,
          :availability_date,
          :academic_level_id,
          :subscribe_date,
          :unsubscribe_date,
          :unsubscribe_reason_id,
          :comments,
          :expectations,
          :agreement,
          :agreement_date,
          :search_authorization,
          :representative_statement,
          :has_driving_license,
          :public_pictures,
          :annual_survey,
          :manager_id,
          :info_source_id,
          :other_academic_info,
          :profession_id,
          :review,
          :error_address,
          :error_other,
          {
            availabilities_attributes: [
              :id,
              :day,
              :start_hour,
              :end_hour,
              :_destroy
            ]
          },
          {
            known_languages_attributes: [
              :id,
              :volunteer_id,
              :language_id,
              :language_level_id,
              :_destroy
            ]
          },
          {
            assessments_attributes: [
              :id,
              :volunteer_id,
              :trait_id,
              :trait_other,
              :_destroy
            ]
          },
          {
            assessments_projects_attributes: [
              :id,
              :volunteer_id,
              :trait_id,
              :project_id,
              :trait_other,
              :_destroy
            ]
          },
          { skill_ids: [] },
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
          { project_ids: [] },
          { trait_ids: [] },
          { area_ids: [] },
          { collective_ids: [] },
          {
            degrees_attributes: [
              :id,
              :name,
              :degree_type,
              :degree_type_id,
              :_destroy
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
          }
        )
    end
end
