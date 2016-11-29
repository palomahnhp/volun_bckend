class PtPunctualsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= PtPunctual.ransack_default
    @search_q = @pt_punctuals.search(params[:q])
    @pt_punctuals = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_punctuals)
  end

  def show
    respond_with(@pt_punctual) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @pt_punctual = PtPunctual.new
    respond_with(@pt_punctual)
  end

  def edit
  end

  def create
    @pt_punctual.save
    respond_with(@pt_punctual, location: projects_path)
  end

  def update
    @pt_punctual.update_attributes(pt_punctual_params)
    respond_with(@pt_punctual, location: projects_path)
  end

  def destroy
    @pt_punctual.destroy
    respond_with(@pt_punctual, location: projects_path)
  end

  protected

    def pt_punctual_params
      params.require(:pt_punctual).permit(permitted_project_attrs)
    end
end
