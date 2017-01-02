class RtActivityPublishingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtActivityPublishing.ransack_default
    @search_q = @rt_activity_publishings.search(params[:q])
    @rt_activity_publishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_activity_publishings)
  end

  def show
    respond_with(@rt_activity_publishing) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rt_activity_publishing = RtActivityPublishing.new
    respond_with(@rt_activity_publishing)
  end

  def edit
  end

  def create
    @rt_activity_publishing.save
    respond_with(@rt_activity_publishing)
  end

  def update
    @rt_activity_publishing.update_attributes(rt_activity_publishing_params)
    respond_with(@rt_activity_publishing)
  end

  def destroy
    @rt_activity_publishing.destroy
    respond_with(@rt_activity_publishing)
  end

  protected

    def rt_activity_publishing_params
      params.require(:rt_activity_publishing).permit(:name, :organizer, :description, :execution_date, :execution_hour, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province)
    end
end
