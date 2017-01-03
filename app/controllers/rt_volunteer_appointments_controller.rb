class RtVolunteerAppointmentsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtVolunteerAppointment.ransack_default
    @search_q = @rt_volunteer_appointments.search(params[:q])
    @rt_volunteer_appointments = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteer_appointments)
  end

  def show
    respond_with(@rt_volunteer_appointment) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rt_volunteer_appointment = RtVolunteerAppointment.new
    respond_with(@rt_volunteer_appointment)
  end

  def edit
  end

  def create
    @rt_volunteer_appointment.save
    respond_with(@rt_volunteer_appointment)
  end

  def update
    @rt_volunteer_appointment.update_attributes(rt_volunteer_appointment_params)
    respond_with(@rt_volunteer_appointment)
  end

  def destroy
    @rt_volunteer_appointment.destroy
    respond_with(@rt_volunteer_appointment)
  end

  protected

    def rt_volunteer_appointment_params
      params.require(:rt_volunteer_appointment).permit(:volunteer_id, :reason)
    end
end
