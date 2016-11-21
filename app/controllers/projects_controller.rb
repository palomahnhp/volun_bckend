class ProjectsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Project.ransack_default
    @search_q = @projects.includes(:districts, :areas, :collectives, :project_type).search(params[:q])
    @projects = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@projects)
  end

  def show
    respond_with(@project) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project.save
    respond_with(@project)
  end

  def update
    @project.update_attributes(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  def recover
    @project.recover
    respond_with(@project)
  end

  def new_options
  end

  protected

    def project_params
      params.require(:project).permit(:name, :active, :description, :functions, :execution_start_date, :execution_end_date, :contact_person, :phone_number, :email, :comments, :beneficiaries_num, :volunteers_num, :insured, :insurance_date, :project_type_id, :entity_id)
    end
end
