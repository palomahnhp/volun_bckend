class RoadTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RoadType.ransack_default
    @search_q = @road_types.search(params[:q])
    @road_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@road_types)
  end

  def show
    respond_with(@road_type) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @road_type = RoadType.new
    respond_with(@road_type)
  end

  def edit
  end

  def create
    @road_type.save
    respond_with(@road_type)
  end

  def update
    @road_type.update_attributes(road_type_params)
    respond_with(@road_type)
  end

  def destroy
    @road_type.destroy
    respond_with(@road_type)
  end

  protected

    def road_type_params
      params.require(:road_type).permit(:name, :code)
    end
end
