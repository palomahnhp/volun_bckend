class AcademicLevelsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= AcademicLevel.ransack_default
    @search_q = @academic_levels.search(params[:q])
    @academic_levels = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@academic_levels)
  end

  def show
    respond_with(@academic_level) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @academic_level = AcademicLevel.new
    respond_with(@academic_level)
  end

  def edit
  end

  def create
    @academic_level.save
    respond_with(@academic_level)
  end

  def update
    @academic_level.update_attributes(academic_level_params)
    respond_with(@academic_level)
  end

  def destroy
    @academic_level.destroy
    respond_with(@academic_level)
  end

  protected

    def academic_level_params
      params.require(:academic_level).permit(:name, :educational_type, :active)
    end
end
