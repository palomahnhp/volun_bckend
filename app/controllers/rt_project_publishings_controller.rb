class RtProjectPublishingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtProjectPublishing.ransack_default
    @search_q = @rt_project_publishings.search(params[:q])
    @rt_project_publishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_project_publishings)
  end

  def show
    respond_with(@rt_project_publishing) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def edit
  end

  def update
    @rt_project_publishing.update_attributes(rt_project_publishing_params)
    respond_with(@rt_project_publishing)
  end

  protected

    def rt_project_publishing_params
      params.require(:rt_project_publishing).permit(:description, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province)
    end
end