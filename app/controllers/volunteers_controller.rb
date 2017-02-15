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
    respond_with(@volunteer)
  end

  def edit
  end

  def create
    request_form = Rt::VolunteerSubscribe.find_by(id: session[:rt_volunteer_subscribe_id]).try :request_form
    if request_form
      if @volunteer.save
        user = User.new(login: "user#{'%09d' % @volunteer.id}",
                        loggable: @volunteer,
                        notice_type: NoticeType.email.take)
        # TODO Remove this line after removing email column from users
        user.email = "#{user.login}@voluntario_por_madrid.es"
        user.save(validate: false)
        request_form.update_and_trace(:approved, manager_id: current_user.loggable.id, user_id: user.id)
      end
      respond_with(@volunteer, lolcation: rt_volunteer_subscribes_path)
    else
      redirect_to rt_volunteer_subscribes_path, alert: 'La solicitud de alta de voluntario ya no existe'
    end
  end

  def update
    @volunteer.update_attributes(volunteer_params)
    respond_with(@volunteer)
  end

  def destroy
    @volunteer.destroy
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
              :_destroy
            ]
          }
        )
    end
end
