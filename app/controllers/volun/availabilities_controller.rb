class Volun::AvailabilitiesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Volun::Availability.ransack_default
    @search_q = @volun_availabilities.search(params[:q])
    @volun_availabilities = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@volun_availabilities)
  end

  def show
    respond_with(@volun_availability) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    respond_with(@volun_availability)
  end

  def edit
  end

  def create
    @volun_availability.save
    respond_with(@volun_availability)
  end

  def update
    @volun_availability.update_attributes(volun_availability_params)
    respond_with(@volun_availability)
  end

  def destroy
    @volun_availability.destroy
    respond_with(@volun_availability)
  end

  protected

    def volun_availability_params
      params.require(:volun_availability).permit(:volunteer_id, :day, :start_hour, :end_hour)
    end
end
