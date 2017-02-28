class VolunteersController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Volunteer.ransack_default
    @search_q = @volunteers.search(params[:q])
    @volunteers = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@volunteers)
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
      @volunteer = volunteer_manager.build_volunteer
      respond_with(@volunteer)
    else
      redirect_to rt_volunteer_subscribes_path, alert: volunteer_manager.errors.to_sentence
    end
  end

  def edit
    if params[:rt_volunteer_unsubscribe_id].present?
      @rt_volunteer_unsubscribe = Rt::VolunteerUnsubscribe.find(params[:rt_volunteer_unsubscribe_id])
    end
  end

  def create
    volunteer_manager = VolunteerManager.new(rt_volunteer_subscribe_id: params[:rt_volunteer_subscribe_id],
                                             volunteer_attributes: volunteer_params,
                                             manager_id: current_user.loggable_id)
    volunteer_manager.create_volunteer
    @volunteer = volunteer_manager.volunteer
    if @volunteer.persisted? || @volunteer.errors.present?
      respond_with(@volunteer)
    else
      redirect_to rt_volunteer_subscribes_path, alert: volunteer_manager.errors.to_sentence
    end
  end

  def update
    #@volunteer.update_attributes(volunteer_params)
    #respond_with(@volunteer)
    volunteer_manager = VolunteerManager.new(rt_volunteer_unsubscribe_id: params[:rt_volunteer_unsubscribe_id],
                                             volunteer_attributes: volunteer_params,
                                             manager_id: current_user.loggable_id)
    volunteer_manager.update_volunteer(@volunteer)
    @volunteer = volunteer_manager.volunteer
    if @volunteer.persisted? || @volunteer.errors.present?
      respond_with(@volunteer)
    else
      redirect_to rt_volunteer_subscribes_path, alert: volunteer_manager.errors.to_sentence
    end
  end

  def destroy
    @volunteer.destroy
    respond_with(@volunteer)
  end

  def recover
    @volunteer.recover
    respond_with(@volunteer)
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
              :no_bdc_check,
              :_destroy
            ]
          }
        )
    end
end
