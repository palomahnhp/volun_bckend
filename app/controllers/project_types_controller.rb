class ProjectTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectType.ransack_default
    @search_q = @project_types.search(params[:q])
    @project_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_types)
  end

  def show
    respond_with(@project_type) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_type = ProjectType.new
    respond_with(@project_type)
  end

  def edit
  end

  def create
    @project_type.save
    respond_with(@project_type)
  end

  def update
    @project_type.update_attributes(project_type_params)
    respond_with(@project_type)
  end

  def destroy
    @project_type.destroy
    respond_with(@project_type)
  end

  def recover
    @project_type.recover
    respond_with(@project_type)
  end

  protected

    def project_type_params
      params.require(:project_type).permit(:kind, :description, :active)
    end
end
