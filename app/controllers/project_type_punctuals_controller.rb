class ProjectTypePunctualsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectTypePunctual.ransack_default
    @search_q = @project_type_punctuals.search(params[:q])
    @project_type_punctuals = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_type_punctuals)
  end

  def show
    respond_with(@project_type_punctual) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_type_punctual = ProjectTypePunctual.new
    respond_with(@project_type_punctual)
  end

  def edit
  end

  def create
    @project_type_punctual.save
    respond_with(@project_type_punctual, location: projects_path)
  end

  def update
    @project_type_punctual.update_attributes(project_type_punctual_params)
    respond_with(@project_type_punctual, location: projects_path)
  end

  def destroy
    @project_type_punctual.destroy
    respond_with(@project_type_punctual, location: projects_path)
  end

  protected

    def project_type_punctual_params
      params.require(:project_type_punctual).permit(:project_id, :project_type_id)
    end
end
