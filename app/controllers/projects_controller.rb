class ProjectsController < ApplicationController

  load_and_authorize_resource
  before_action :set_pt_extension, only: [:show, :new, :edit, :create, :update]

  respond_to :html, :js, :json

  def index
    params[:q] ||= Project.ransack_default
    @projects = @projects.with_status(params[:status])
    @search_q = @projects.unscoped.list.search(params[:q])
    @projects = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@projects)
  end

  def show
    respond_with(@project) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project.project_type = ProjectType.where(kind: ProjectType.kinds[@pt_extension]).take
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

  def pt_extensions_menu
  end

  protected

    def set_pt_extension
      @pt_extension = params[:pt_extension]
    end

    def project_params
      params
        .require(:project)
        .permit(
          :id,
          :name,
          :description,
          :volunteers_allowed,
          :publish,
          :outstanding,
          :pt_subvention,
          :project_type_id,
          :active,
          :comments,
          :beneficiaries_num,
          :volunteers_num,
          :functions,
          :insured,
          :insurance_date,
          :contact_name,
          :contact_last_name,
          :contact_last_name_alt,
          :email,
          :phone_number,
          :entity_id,
          :execution_start_date,
          :execution_end_date,
          { area_ids:         [] },
          { collective_ids:   [] },
          { coordination_ids: [] },
          {
            documents_attributes: [
              :id,
              :name,
              :_destroy
            ]
          },
          {
            events_attributes: [
              :id,
              {
                address_attributes: [
                  :id,
                  :road_type_id,
                  :road_name,
                  :road_number_type,
                  :road_number,
                  :grader,
                  :stairs,
                  :floor,
                  :door,
                  :postal_code,
                  :borough,
                  :district_id,
                  :town,
                  :province_id,
                  :country,
                  :_destroy
                ]
              },
              {
                timetables_attributes: [
                  :id,
                  :execution_date,
                  :start_hour,
                  :end_hour,
                  :_destroy
                ]
              },
              :_destroy
            ]
          }
        )
    end
end
