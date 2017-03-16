class Ent::TrackingsController < ApplicationController

  load_and_authorize_resource instance_name: :ent_tracking
  respond_to :html, :js, :json

  def index
    params[:q] ||= Ent::Tracking.ransack_default
    if params[:tracked_record_id].nil?
      @entity = session[:tracked_record_id]
    else
      @entity = params[:tracked_record_id]
      session[:tracked_record_id] = @entity
    end
    @search_q = @ent_trackings.search(params[:q])
    @ent_trackings = @search_q.result.where(entity_id: @entity).paginate(page: params[:page], per_page: params[:per_page]||15)

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
    @ent_tracking.entity_id = params[:tracked_record_id]
    respond_with(@ent_tracking)
  end

  def edit
  end

  def create
    @ent_tracking.save
    session[:tracked_record_id] = @ent_tracking.entity_id
    respond_with(@ent_tracking)
  end

  def update
    @ent_tracking.update_attributes(ent_tracking_params)
    session[:tracked_record_id] = @ent_tracking.entity_id
    respond_with(@ent_tracking)
  end

  def destroy
    @ent_tracking.destroy
    respond_with(@ent_tracking)
  end

  protected

    def ent_tracking_params
      params
        .require(:ent_tracking)
        .permit(
          :entity_id,
          :tracking_type_id,
          :manager_id,
          :tracked_at,
          :comments
        )
    end
    
  alias_method :create_params, :ent_tracking_params
end
