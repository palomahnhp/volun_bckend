class Volun::AssessmentsController < ApplicationController

  load_and_authorize_resource instance_name: :volun_assessment
  respond_to :html, :js, :json

  def index
    params[:q] ||= Volun::Assessment.ransack_default
    @search_q = @volun_assessments.search(params[:q])
    @volun_assessments = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@volun_assessments)
  end

  def show
    respond_with(@volun_assessment) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    respond_with(@volun_assessment)
  end

  def edit
  end

  def create
    @volun_assessment.save
    respond_with(@volun_assessment)
  end

  def update
    @volun_assessment.update_attributes(volun_assessment_params)
    respond_with(@volun_assessment)
  end

  def destroy
    @volun_assessment.destroy
    respond_with(@volun_assessment)
  end

  protected

    def volun_assessment_params
      params
        .require(:volun_assessment)
        .permit(
          :volunteer_id,
          :trait_id,
          :project_id,
          :trait_other,
          :assessment,
          :comments
        )
    end

    alias_method :create_params, :volun_assessment_params

end
