class ProjectTypePermanentsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectTypePermanent.ransack_default
    @search_q = @project_type_permanents.search(params[:q])
    @project_type_permanents = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_type_permanents)
  end

  def show
    respond_with(@project_type_permanent) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_type_permanent = ProjectTypePermanent.new
    respond_with(@project_type_permanent)
  end

  def edit
  end

  def create
    @project_type_permanent.save
    respond_with(@project_type_permanent, location: projects_path)
  end

  def update
    @project_type_permanent.update_attributes(project_type_permanent_params)
    respond_with(@project_type_permanent)
  end

  def destroy
    @project_type_permanent.destroy
    respond_with(@project_type_permanent)
  end

  protected

    def project_type_permanent_params
      params
        .require(:project_type_permanent)
        .permit(:project_id,
                :project_type_id,
                permitted_project_attrs)
    end
end
