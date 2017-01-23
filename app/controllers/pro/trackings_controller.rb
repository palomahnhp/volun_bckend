class Pro::TrackingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProTracking.ransack_default
    @search_q = @pro_trackings.search(params[:q])
    @pro_trackings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pro_trackings)
  end

  def show
    respond_with(@pro_tracking) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @pro_tracking = Pro::Tracking.new
    respond_with(@pro_tracking)
  end

  def edit
  end

  def create
    @pro_tracking.save
    respond_with(@pro_tracking)
  end

  def update
    @pro_tracking.update_attributes(pro_tracking_params)
    respond_with(@pro_tracking)
  end

  def destroy
    @pro_tracking.destroy
    respond_with(@pro_tracking)
  end

  protected

    def pro_tracking_params
      params.require(:pro_tracking).permit(:comments, :start_date, :project_id)
    end
end
