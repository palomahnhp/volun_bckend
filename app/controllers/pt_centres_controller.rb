class PtCentresController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= PtCentre.ransack_default
    @search_q = @pt_centres.search(params[:q])
    @pt_centres = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_centres)
  end

  def show
    respond_with(@pt_centre) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @pt_centre = PtCentre.new
    respond_with(@pt_centre)
  end

  def edit
  end

  def create
    @pt_centre.save
    respond_with(@pt_centre, location: projects_path)
  end

  def update
    @pt_centre.update_attributes(pt_centre_params)
    respond_with(@pt_centre, location: projects_path)
  end

  def destroy
    @pt_centre.destroy
    respond_with(@pt_centre, location: projects_path)
  end

  protected

  def project_type_centre_params
    params
      .require(:project_type_centre)
      .permit(:project_id,
              :project_type_id,
              permitted_project_attrs)
  end
end
