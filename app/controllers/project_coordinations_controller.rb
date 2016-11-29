class ProjectCoordinationsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectCoordination.ransack_default
    @search_q = @project_coordinations.search(params[:q])
    @project_coordinations = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_coordinations)
  end

  def show
    respond_with(@project_coordination) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_coordination = ProjectCoordination.new
    respond_with(@project_coordination)
  end

  def edit
  end

  def create
    @project_coordination.save
    respond_with(@project_coordination)
  end

  def update
    @project_coordination.update_attributes(project_coordination_params)
    respond_with(@project_coordination)
  end

  def destroy
    @project_coordination.destroy
    respond_with(@project_coordination)
  end

  def recover
    @project_coordination.recover
    respond_with(@project_coordination)
  end

  protected

    def project_coordination_params
      params.require(:project_coordination).permit(:project_id, :coordination_id)
    end
end
