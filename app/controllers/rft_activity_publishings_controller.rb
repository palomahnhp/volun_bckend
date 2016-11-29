class RftActivityPublishingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftActivityPublishing.ransack_default
    @search_q = @rft_activity_publishings.search(params[:q])
    @rft_activity_publishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_activity_publishings)
  end

  def show
    respond_with(@rft_activity_publishing) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_activity_publishing = RftActivityPublishing.new
    respond_with(@rft_activity_publishing)
  end

  def edit
  end

  def create
    @rft_activity_publishing.save
    respond_with(@rft_activity_publishing)
  end

  def update
    @rft_activity_publishing.update_attributes(rft_activity_publishing_params)
    respond_with(@rft_activity_publishing)
  end

  def destroy
    @rft_activity_publishing.destroy
    respond_with(@rft_activity_publishing)
  end

  protected

    def rft_activity_publishing_params
      params.require(:rft_activity_publishing).permit(:request_form_type_id, :entity_id, :name, :organizer, :description, :execution_date, :execution_hour, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province)
    end
end
