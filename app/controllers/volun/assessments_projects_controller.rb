class Volun::AssessmentsProjectsController < ApplicationController

  load_and_authorize_resource instance_name: :volun_assessments_project
  respond_to :html, :js, :json

  def index
    params[:q] ||= Volun::Assessment.ransack_default
    @search_q = @volun_assessments_projects.search(params[:q])
    @volun_assessments_projects = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@volun_assessments_projects)
  end

  def show
    respond_with(@volun_assessments_project) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@volun_assessments_project)
  end

  def edit
  end

  def create
    @volun_assessments_project.save
    respond_with(@volun_assessments_project)
  end

  def update
    @volun_assessments_project.update_attributes(volun_assessments_project_params)
    respond_with(@volun_assessments_project)
  end

  def destroy
    @volun_assessments_project.destroy
    respond_with(@volun_assessments_project)
  end

  protected

    def volun_assessments_project_params
      params
        .require(:volun_assessments_project)
        .permit(
          :volunteer_id,
          :project_id
          :trait_id,
          :trait_other,
          :assessment,
          :comments
        )
    end

    alias_method :create_params, :volun_assessments_project_params

end
