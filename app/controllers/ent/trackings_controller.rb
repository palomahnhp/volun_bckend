class Ent::TrackingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= EntTracking.ransack_default
    @search_q = @ent_trackings.search(params[:q])
    @ent_trackings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@ent_trackings)
  end

  def show
    respond_with(@ent_tracking) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @ent_tracking = Ent::Tracking.new
    respond_with(@ent_tracking)
  end

  def edit
  end

  def create
    @ent_tracking.save
    respond_with(@ent_tracking)
  end

  def update
    @ent_tracking.update_attributes(ent_tracking_params)
    respond_with(@ent_tracking)
  end

  def destroy
    @ent_tracking.destroy
    respond_with(@ent_tracking)
  end

  protected

    def ent_tracking_params
      params.require(:ent_tracking).permit(:tracking_type_id, :entity_id, :manager_id, :tracked_at, :comments)
    end
end
