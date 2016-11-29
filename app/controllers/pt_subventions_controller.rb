class PtSubventionsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= PtSubvention.ransack_default
    @search_q = @pt_subventions.search(params[:q])
    @pt_subventions = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_subventions)
  end

  def show
    respond_with(@pt_subvention) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @pt_subvention = PtSubvention.new
    respond_with(@pt_subvention)
  end

  def edit
  end

  def create
    @pt_subvention.save
    respond_with(@pt_subvention, location: projects_path)
  end

  def update
    @pt_subvention.update_attributes(pt_subvention_params)
    respond_with(@pt_subvention, location: projects_path)
  end

  def destroy
    @pt_subvention.destroy
    respond_with(@pt_subvention, location: projects_path)
  end

  protected

    def pt_subvention_params
      params
        .require(:pt_subvention)
        .permit(:representative_name,
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
                :proposal_id,
                permitted_project_attrs)
    end
end
