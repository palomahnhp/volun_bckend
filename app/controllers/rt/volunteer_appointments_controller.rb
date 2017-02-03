class Rt::VolunteerAppointmentsController < ApplicationController

  load_and_authorize_resource instance_name: :rt_volunteer_appointment
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::VolunteerAppointment.ransack_default
    @search_q = @rt_volunteer_appointments.search(params[:q])
    @rt_volunteer_appointments = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteer_appointments)
  end

  def show
    respond_with(@rt_volunteer_appointment) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_volunteer_appointment)
  end

  def edit
  end

  def create
    @rt_volunteer_appointment.save
    respond_with(@rt_volunteer_appointment, location: projects_path)
  end

  def update
    @rt_volunteer_appointment.update(rt_volunteer_appointment_params)
    respond_with(@rt_volunteer_appointment, location: projects_path)
  end

  def destroy
    @rt_volunteer_appointment.destroy
    respond_with(@rt_volunteer_appointment)
  end

  protected

    def rt_volunteer_appointment_params
      params
        .require(:rt_volunteer_appointment)
        .permit(:volunteer_id, :reason, request_form_attributes: request_form_attributes)
    end

    alias_method :create_params, :rt_volunteer_appointment_params
end
