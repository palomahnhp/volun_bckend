class ProjectsController < ApplicationController

  load_and_authorize_resource
  before_action :set_pt_extension, only: [:show, :new, :edit, :create, :update]

  respond_to :html, :js, :json

  def index
    params[:q] ||= Project.ransack_default
    @projects = @projects.with_status(params[:status])
    @search_q = @projects.includes(:pt_extendable, :project_type, :entity, :areas, :districts, :collectives).search(params[:q])
    @projects = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@projects)
  end

  def show
    respond_with(@project) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
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
      @project.project_type = ProjectType.where(kind: ProjectType.kinds[@pt_extension]).take
    end

    def project_params
      params
        .require(:project)
        .permit(
          :id,
          :name,
          :description,
          :volunteers_allowed,
          :public,
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
          documents_attributes: [
            :id,
            :name,
            :_destroy
          ]
      # TODO Pending of adapting addresses and timetables form to the new model design
          # addresses_attributes: [
          #   :id,
          #   :road_type_id,
          #   :road_name,
          #   :road_number_type,
          #   :road_number,
          #   :grader,
          #   :stairs,
          #   :floor,
          #   :door,
          #   :postal_code,
          #   :town,
          #   :province_id,
          #   :country,
          #   :_destroy
          # ],
      # TODO Pending of adapting addresses and timetables form to the new model design
      #     timetables_attributes: [
      #       :id,
      #       :day,
      #       :start_hour,
      #       :end_hour,
      #       :_destroy
      #     ],
        )
    end
end
