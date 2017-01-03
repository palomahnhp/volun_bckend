class RtVolunteerAmendmentsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtVolunteerAmendment.ransack_default
    @search_q = @rt_volunteer_amendments.search(params[:q])
    @rt_volunteer_amendments = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteer_amendments)
  end

  def show
    respond_with(@rt_volunteer_amendment) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rt_volunteer_amendment = RtVolunteerAmendment.new
    respond_with(@rt_volunteer_amendment)
  end

  def edit
  end

  def create
    @rt_volunteer_amendment.save
    respond_with(@rt_volunteer_amendment)
  end

  def update
    @rt_volunteer_amendment.update_attributes(rt_volunteer_amendment_params)
    respond_with(@rt_volunteer_amendment)
  end

  def destroy
    @rt_volunteer_amendment.destroy
    respond_with(@rt_volunteer_amendment)
  end

  protected

    def rt_volunteer_amendment_params
      params.require(:rt_volunteer_amendment).permit(:volunteer_id, :address_id, :phone_number, :phone_number_alt)
    end
end
