class ProjectCollectivesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectCollective.ransack_default
    @search_q = @project_collectives.search(params[:q])
    @project_collectives = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_collectives)
  end

  def show
    respond_with(@project_collective) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_collective = ProjectCollective.new
    respond_with(@project_collective)
  end

  def edit
  end

  def create
    @project_collective.save
    respond_with(@project_collective)
  end

  def update
    @project_collective.update_attributes(project_collective_params)
    respond_with(@project_collective)
  end

  def destroy
    @project_collective.destroy
    respond_with(@project_collective)
  end

  def recover
    @project_collective.recover
    respond_with(@project_collective)
  end

  protected

    def project_collective_params
      params.require(:project_collective).permit(:project_id, :collective_id)
    end
end
