class Volun::TrackingsController < ApplicationController

  load_and_authorize_resource instance_name: :volun_tracking
  respond_to :html, :js, :json

  def index
    params[:q] ||= Volun::Tracking.ransack_default
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
      params
        .require(:volun_tracking)
        .permit(
          :volunteer_id,
          :tracking_type_id,
          :project_id,
          :technician_id,
          :tracking_date,
          :comments
        )
    end

  alias_method :create_params, :volun_tracking_params

end
