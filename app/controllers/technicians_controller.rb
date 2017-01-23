class TechniciansController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Technician.ransack_default
    @search_q = @technicians.search(params[:q])
    @technicians = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@technicians)
  end

  def show
    respond_with(@technician) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @technician = Technician.new
    respond_with(@technician)
  end

  def edit
  end

  def create
    @technician.save
    respond_with(@technician)
  end

  def update
    @technician.update_attributes(technician_params)
    respond_with(@technician)
  end

  def destroy
    @technician.destroy
    respond_with(@technician)
  end

  protected

    def technician_params
      params.require(:technician).permit(:name, :profile_id, :active)
    end
end
