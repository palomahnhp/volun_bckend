class Rt::ProjectPublishingsController < ApplicationController

  load_and_authorize_resource instance_name: :rt_project_publishing
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::ProjectPublishing.ransack_default
    @search_q = @rt_project_publishings.search(params[:q])
    @rt_project_publishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_project_publishings)
  end

  def show
    respond_with(@rt_project_publishing) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_project_publishing)
  end

  def edit
  end

  def create
    @rt_project_publishing.save
    respond_with(@rt_project_publishing, location: projects_path)
  end

  def update
    @rt_project_publishing.update(rt_project_publishing_params)
    respond_with(@rt_project_publishing, location: projects_path)
  end

  def destroy
    @rt_project_publishing.destroy
    respond_with(@rt_project_publishing)
  end

  protected

    def rt_project_publishing_params
      params
        .require(:rt_project_publishing)
        .permit(
          :description,
          :road_type,
          :road_name,
          :number_type,
          :road_number,
          :postal_code,
          :town,
          :province,
          request_form_attributes: request_form_attributes
        )
    end

    alias_method :create_params, :rt_project_publishing_params
end
