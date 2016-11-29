class TrackingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Tracking.ransack_default
    @search_q = @trackings.search(params[:q])
    @trackings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@trackings)
  end

  def show
    respond_with(@tracking) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @tracking = Tracking.new
    respond_with(@tracking)
  end

  def edit
  end

  def create
    @tracking.save
    respond_with(@tracking)
  end

  def update
    @tracking.update_attributes(tracking_params)
    respond_with(@tracking)
  end

  def destroy
    @tracking.destroy
    respond_with(@tracking)
  end

  protected

    def tracking_params
      params.require(:tracking).permit(:comments, :start_date, :project_id)
    end
end
