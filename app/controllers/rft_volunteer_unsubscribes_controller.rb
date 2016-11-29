class RftVolunteerUnsubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftVolunteerUnsubscribe.ransack_default
    @search_q = @rft_volunteer_unsubscribes.search(params[:q])
    @rft_volunteer_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_volunteer_unsubscribes)
  end

  def show
    respond_with(@rft_volunteer_unsubscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_volunteer_unsubscribe = RftVolunteerUnsubscribe.new
    respond_with(@rft_volunteer_unsubscribe)
  end

  def edit
  end

  def create
    @rft_volunteer_unsubscribe.save
    respond_with(@rft_volunteer_unsubscribe)
  end

  def update
    @rft_volunteer_unsubscribe.update_attributes(rft_volunteer_unsubscribe_params)
    respond_with(@rft_volunteer_unsubscribe)
  end

  def destroy
    @rft_volunteer_unsubscribe.destroy
    respond_with(@rft_volunteer_unsubscribe)
  end

  protected

    def rft_volunteer_unsubscribe_params
      params.require(:rft_volunteer_unsubscribe).permit(:request_form_type_id, :volunteer_id, :level, :reason)
    end
end
