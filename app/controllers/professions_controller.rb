class ProfessionsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Profession.ransack_default
    @search_q = @professions.search(params[:q])
    @professions = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@professions)
  end

  def show
    respond_with(@profession) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @profession = Profession.new
    respond_with(@profession)
  end

  def edit
  end

  def create
    @profession.save
    respond_with(@profession)
  end

  def update
    @profession.update_attributes(profession_params)
    respond_with(@profession)
  end

  def destroy
    @profession.destroy
    respond_with(@profession)
  end

  protected

    def profession_params
      params.require(:profession).permit(:name, :active)
    end
end
