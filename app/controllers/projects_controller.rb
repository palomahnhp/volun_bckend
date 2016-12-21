class ProjectsController < ApplicationController

  load_and_authorize_resource
  before_action :set_pt_extension, only: [:show, :new, :edit, :create, :update]

  respond_to :html, :js, :json

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
      @project.build_pt_extendable @pt_extension
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
          pt_extendable_attributes: pt_extendable_attributes,
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

    def pt_extendable_attributes
      case params[:pt_extension]
      when 'pt_subvention' then pt_subvention_attributes
      when 'pt_entity'     then pt_entity_attributes
      else {}
      end
    end

    def pt_subvention_attributes
      [
        :id,
        :representative_name,
        :representative_first_surname,
        :representative_second_surname,
        :id_num,
        :vat_num,
        :entity_registry,
        :cost,
        :requested_amount,
        :subsidized_amount,
        :initial_volunteers_num,
        :participants_num,
        :has_quality_evaluation,
        :proposal_id
      ]
    end

    def pt_entity_attributes
      [
        :id,
        :request_date,
        :request_description,
        :volunteers_profile,
        :activities,
        :sav_date,
        :derived_volunteers_num,
        :added_volunteers_num,
        :agreement_signed,
        :agreement_date,
        :prevailing
      ]
    end
end
