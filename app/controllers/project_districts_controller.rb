class ProjectDistrictsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectDistrict.ransack_default
    @search_q = @project_districts.search(params[:q])
    @project_districts = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_districts)
  end

  def show
    respond_with(@project_district) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_district = ProjectDistrict.new
    respond_with(@project_district)
  end

  def edit
  end

  def create
    @project_district.save
    respond_with(@project_district)
  end

  def update
    @project_district.update_attributes(project_district_params)
    respond_with(@project_district)
  end

  def destroy
    @project_district.destroy
    respond_with(@project_district)
  end

  def recover
    @project_district.recover
    respond_with(@project_district)
  end

  protected

    def project_district_params
      params.require(:project_district).permit(:project_id, :district_id)
    end
end
