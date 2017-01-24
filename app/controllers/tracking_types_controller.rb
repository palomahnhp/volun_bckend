class TrackingTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= TrackingType.ransack_default
    @search_q = @tracking_types.search(params[:q])
    @tracking_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@tracking_types)
  end

  def show
    respond_with(@tracking_type) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @tracking_type = TrackingType.new
    respond_with(@tracking_type)
  end

  def edit
  end

  def create
    @tracking_type.save
    respond_with(@tracking_type)
  end

  def update
    @tracking_type.update_attributes(tracking_type_params)
    respond_with(@tracking_type)
  end

  def destroy
    @tracking_type.destroy
    respond_with(@tracking_type)
  end

  def recover
    @tracking_type.recover
    respond_with(@tracking_type)
  end

  protected

    def tracking_type_params
      params.require(:tracking_type).permit(:name, :active)
    end
end
