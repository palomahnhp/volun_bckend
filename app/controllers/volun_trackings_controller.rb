class VolunTrackingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= VolunTracking.ransack_default
    @search_q = @volun_trackings.search(params[:q])
    @volun_trackings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@volun_trackings)
  end

  def show
    respond_with(@volun_tracking) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @volun_tracking = VolunTracking.new
    respond_with(@volun_tracking)
  end

  def edit
  end

  def create
    @volun_tracking.save
    respond_with(@volun_tracking)
  end

  def update
    @volun_tracking.update_attributes(volun_tracking_params)
    respond_with(@volun_tracking)
  end

  def destroy
    @volun_tracking.destroy
    respond_with(@volun_tracking)
  end

  protected

    def volun_tracking_params
      params.require(:volun_tracking).permit(:volunteer_id, :tracking_id, :project_id, :technician_id, :tracking_date, :comments)
    end
end
