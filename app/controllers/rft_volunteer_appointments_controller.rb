class RftVolunteerAppointmentsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftVolunteerAppointment.ransack_default
    @search_q = @rft_volunteer_appointments.search(params[:q])
    @rft_volunteer_appointments = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_volunteer_appointments)
  end

  def show
    respond_with(@rft_volunteer_appointment) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_volunteer_appointment = RftVolunteerAppointment.new
    respond_with(@rft_volunteer_appointment)
  end

  def edit
  end

  def create
    @rft_volunteer_appointment.save
    respond_with(@rft_volunteer_appointment)
  end

  def update
    @rft_volunteer_appointment.update_attributes(rft_volunteer_appointment_params)
    respond_with(@rft_volunteer_appointment)
  end

  def destroy
    @rft_volunteer_appointment.destroy
    respond_with(@rft_volunteer_appointment)
  end

  protected

    def rft_volunteer_appointment_params
      params.require(:rft_volunteer_appointment).permit(:request_form_type_id, :volunteer_id, :reason)
    end
end
