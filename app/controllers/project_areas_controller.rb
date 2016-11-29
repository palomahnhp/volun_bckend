class ProjectAreasController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectArea.ransack_default
    @search_q = @project_areas.search(params[:q])
    @project_areas = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_areas)
  end

  def show
    respond_with(@project_area) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_area = ProjectArea.new
    respond_with(@project_area)
  end

  def edit
  end

  def create
    @project_area.save
    respond_with(@project_area)
  end

  def update
    @project_area.update_attributes(project_area_params)
    respond_with(@project_area)
  end

  def destroy
    @project_area.destroy
    respond_with(@project_area)
  end

  def recover
    @project_area.recover
    respond_with(@project_area)
  end

  protected

    def project_area_params
      params.require(:project_area).permit(:project_id, :area_id)
    end
end
