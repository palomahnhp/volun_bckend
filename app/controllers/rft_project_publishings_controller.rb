class RftProjectPublishingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftProjectPublishing.ransack_default
    @search_q = @rft_project_publishings.search(params[:q])
    @rft_project_publishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_project_publishings)
  end

  def show
    respond_with(@rft_project_publishing) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_project_publishing = RftProjectPublishing.new
    respond_with(@rft_project_publishing)
  end

  def edit
  end

  def create
    @rft_project_publishing.save
    respond_with(@rft_project_publishing)
  end

  def update
    @rft_project_publishing.update_attributes(rft_project_publishing_params)
    respond_with(@rft_project_publishing)
  end

  def destroy
    @rft_project_publishing.destroy
    respond_with(@rft_project_publishing)
  end

  protected

    def rft_project_publishing_params
      params.require(:rft_project_publishing).permit(:request_form_type_id, :entity_id, :description, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province)
    end
end
