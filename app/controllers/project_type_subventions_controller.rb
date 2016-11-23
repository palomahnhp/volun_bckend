class ProjectTypeSubventionsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectTypeSubvention.ransack_default
    @search_q = @project_type_subventions.search(params[:q])
    @project_type_subventions = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_type_subventions)
  end

  def show
    respond_with(@project_type_subvention) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_type_subvention = ProjectTypeSubvention.new
    respond_with(@project_type_subvention)
  end

  def edit
  end

  def create
    @project_type_subvention.save
    respond_with(@project_type_subvention, location: projects_path)
  end

  def update
    @project_type_subvention.update_attributes(project_type_subvention_params)
    respond_with(@project_type_subvention, location: projects_path)
  end

  def destroy
    @project_type_subvention.destroy
    respond_with(@project_type_subvention, location: projects_path)
  end

  protected

    def project_type_subvention_params
      params
        .require(:project_type_subvention)
        .permit(:representative_name,
                :representative_first_surname,
                :representative_second_surname,
                :entity_registry,
                :cost,
                :requested_amount,
                :subsidized_amount,
                :initial_volunteers_num,
                :participants_num,
                :has_quality_evaluation,
                :proposal_id,
                :id_num,
                :vat_num,
                permitted_project_attrs)
    end
end
