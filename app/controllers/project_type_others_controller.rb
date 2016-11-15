class ProjectTypeOthersController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectTypeOther.ransack_default
    @search_q = @project_type_others.search(params[:q])
    @project_type_others = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_type_others)
  end

  def show
    respond_with(@project_type_other) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_type_other = ProjectTypeOther.new
    @project_type_other.build_project
    respond_with(@project_type_other)
  end

  def edit
  end

  def create
    @project_type_other.save
    respond_with(@project_type_other, location: projects_path)
  end

  def update
    @project_type_other.update_attributes(project_type_other_params)
    respond_with(@project_type_other)
  end

  def destroy
    @project_type_other.destroy
    respond_with(@project_type_other)
  end

  protected

    def project_type_other_params
      params
        .require(:project_type_other)
        .permit(:project_id,
                :project_type_id,
                permitted_project_attrs)
    end
end
