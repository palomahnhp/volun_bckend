class RftVolunteerAmendmentsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftVolunteerAmendment.ransack_default
    @search_q = @rft_volunteer_amendments.search(params[:q])
    @rft_volunteer_amendments = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_volunteer_amendments)
  end

  def show
    respond_with(@rft_volunteer_amendment) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_volunteer_amendment = RftVolunteerAmendment.new
    respond_with(@rft_volunteer_amendment)
  end

  def edit
  end

  def create
    @rft_volunteer_amendment.save
    respond_with(@rft_volunteer_amendment)
  end

  def update
    @rft_volunteer_amendment.update_attributes(rft_volunteer_amendment_params)
    respond_with(@rft_volunteer_amendment)
  end

  def destroy
    @rft_volunteer_amendment.destroy
    respond_with(@rft_volunteer_amendment)
  end

  protected

    def rft_volunteer_amendment_params
      params.require(:rft_volunteer_amendment).permit(:request_form_type_id, :volunteer_id, :address_id, :phone_number, :phone_number_alt)
    end
end
