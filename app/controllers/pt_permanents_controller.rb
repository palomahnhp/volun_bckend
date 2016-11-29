class PtPermanentsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= PtPermanent.ransack_default
    @search_q = @pt_permanents.search(params[:q])
    @pt_permanents = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_permanents)
  end

  def show
    respond_with(@pt_permanent) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @pt_permanent = PtPermanent.new
    respond_with(@pt_permanent)
  end

  def edit
  end

  def create
    @pt_permanent.save
    respond_with(@pt_permanent, location: projects_path)
  end

  def update
    @pt_permanent.update_attributes(pt_permanent_params)
    respond_with(@pt_permanent, location: projects_path)
  end

  def destroy
    @pt_permanent.destroy
    respond_with(@pt_permanent, location: projects_path)
  end

  protected

    def pt_permanent_params
      params.require(:pt_permanent).permit(permitted_project_attrs)
    end
end
