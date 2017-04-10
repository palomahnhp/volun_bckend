class Ent::TrackingsController < ApplicationController

  load_and_authorize_resource instance_name: :ent_tracking
  respond_to :html, :js, :json

  def index
    params[:q] ||= Ent::Tracking.ransack_default
    @search_q = @ent_trackings.search(params[:q])
    @entity = Entity.find_by(id: params[:q][:entity_id_eq])
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
    entity = Entity.find_by(id: params[:entity_id])
    @ent_tracking = entity.trackings.build
    respond_with(@ent_tracking)
  end

  def edit
  end

  def create
    @ent_tracking.save
    respond_with(@ent_tracking, location: ent_trackings_path(q: { entity_id_eq: @ent_tracking.entity_id}))
  end

  def update
    @ent_tracking.update_attributes(ent_tracking_params)
    respond_with(@ent_tracking, location: ent_trackings_path(q: { entity_id_eq: @ent_tracking.entity_id}))
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
