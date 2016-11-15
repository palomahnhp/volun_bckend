class ProjectTypeSocialsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectTypeSocial.ransack_default
    @search_q = @project_type_socials.search(params[:q])
    @project_type_socials = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_type_socials)
  end

  def show
    respond_with(@project_type_social) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_type_social = ProjectTypeSocial.new
    respond_with(@project_type_social)
  end

  def edit
  end

  def create
    @project_type_social.save
    respond_with(@project_type_social, location: projects_path)
  end

  def update
    @project_type_social.update_attributes(project_type_social_params)
    respond_with(@project_type_social)
  end

  def destroy
    @project_type_social.destroy
    respond_with(@project_type_social)
  end

  protected

    def project_type_social_params
      params
        .require(:project_type_social)
        .permit(:project_id,
                :project_type_id,
                permitted_project_attrs)
    end
end
