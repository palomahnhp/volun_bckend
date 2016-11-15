class ProjectTypeCentresController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectTypeCentre.ransack_default
    @search_q = @project_type_centres.search(params[:q])
    @project_type_centres = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_type_centres)
  end

  def show
    respond_with(@project_type_centre) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_type_centre = ProjectTypeCentre.new
    @project_type_centre.build_project
    respond_with(@project_type_centre)
  end

  def edit
  end

  def create
    @project_type_centre.save
    respond_with(@project_type_centre, location: projects_path)
  end

  def update
    @project_type_centre.update_attributes(project_type_centre_params)
    respond_with(@project_type_centre)
  end

  def destroy
    @project_type_centre.destroy
    respond_with(@project_type_centre)
  end

  protected

    def project_type_centre_params
      params
        .require(:project_type_centre)
        .permit(:project_id,
                :project_type_id,
                permitted_project_attrs)
    end
end