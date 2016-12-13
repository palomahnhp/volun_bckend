class ProjectsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json
  before_action :set_pt_extension, only: [:new, :create]

  def index
    params[:q] ||= Project.ransack_default
    @projects = @projects.with_status(params[:status])
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

  def select_pt_extensions
  end

  protected

    def set_pt_extension
      @project.build_pt_extendable(params[:pt_extension])
    end

    def project_params
      params
        .require(:project)
        .permit(
          :id,
          :name,
          :description,
          :project_type_id,
          :active,
          :comments,
          :beneficiaries_num,
          :volunteers_num,
          :functions,
          :insured,
          :insurance_date,
          :contact_name,
          :contact_first_surname,
          :contact_second_surname,
          :email,
          :phone_number,
          :entity_id,
          :execution_start_date,
          :execution_end_date,
          area_ids:         [],
          collective_ids:   [],
          coordination_ids: [],
          district_ids:     [],
          addresses_attributes: [
            :id,
            :postal_code,
            :road_type,
            :road_name,
            :road_number_type,
            :road_number,
            :grader,
            :stairs,
            :floor,
            :door,
            :_destroy
          ],
          timetables_attributes: [
            :id,
            :day,
            :start_hour,
            :end_hour,
            :_destroy
          ],
          documents_attributes: [
            :id,
            :name,
            :_destroy
          ]
        )
    end
end
