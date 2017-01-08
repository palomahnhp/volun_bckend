class Pt::SubventionsController < ApplicationController

  load_and_authorize_resource instance_name: :pt_subvention
  respond_to :html, :js, :json

  def index
    params[:q] ||= Pt::Subvention.ransack_default
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
    respond_with(@pt_subvention)
  end

  def edit
  end

  def create
    if @pt_subvention.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    if @pt_subvention.update(pt_subvention_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @pt_subvention.destroy
    respond_with(@pt_subvention)
  end

  protected

    def pt_subvention_params
      params
        .require(:pt_subvention)
        .permit(
          :representative_name,
          :representative_first_surname,
          :representative_second_surname,
          :id_num,
          :vat_num,
          :cost,
          :requested_amount,
          :subsidized_amount,
          :initial_volunteers_num,
          :participants_num,
          :entity_registry,
          :has_quality_evaluation,
          :proposal_id,
          project_attributes: project_attributes
        )
    end

    alias_method :create_params, :pt_subvention_params

end
