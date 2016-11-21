class ProjectTypeEntitiesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectTypeEntity.ransack_default
    @search_q = @project_type_entities.search(params[:q])
    @project_type_entities = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_type_entities)
  end

  def show
    respond_with(@project_type_entity) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_type_entity = ProjectTypeEntity.new
    respond_with(@project_type_entity)
  end

  def edit
  end

  def create
    @project_type_entity.save
    respond_with(@project_type_entity, location: projects_path)
  end

  def update
    @project_type_entity.update_attributes(project_type_entity_params)
    respond_with(@project_type_entity, location: projects_path)
  end

  def destroy
    @project_type_entity.destroy
    respond_with(@project_type_entity, location: projects_path)
  end

  protected

    def project_type_entity_params
      params
        .require(:project_type_entity)
        .permit(:requested_volunteers_num,
                :volunteers_profile,
                :derived_volunteers_num,
                :added_volunteers_num,
                :activities,
                :request_date,
                :request_description,
                :agreement_date,
                :sav_date,
                :agreement_signed,
                :prevailing,
                permitted_project_attrs)
    end
end
