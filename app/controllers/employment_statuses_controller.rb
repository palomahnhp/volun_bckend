class EmploymentStatusesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= EmploymentStatus.ransack_default
    @search_q = @employment_statuses.search(params[:q])
    @employment_statuses = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@employment_statuses)
  end

  def show
    respond_with(@employment_status) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @employment_status = EmploymentStatus.new
    respond_with(@employment_status)
  end

  def edit
  end

  def create
    @employment_status.save
    respond_with(@employment_status)
  end

  def update
    @employment_status.update_attributes(employment_status_params)
    respond_with(@employment_status)
  end

  def destroy
    @employment_status.destroy
    respond_with(@employment_status)
  end

  protected

    def employment_status_params
      params.require(:employment_status).permit(:name, :active)
    end
end
