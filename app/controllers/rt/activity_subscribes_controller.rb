class Rt::ActivitySubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= Rt::ActivitySubscribe.ransack_default
    @search_q = @rt_activity_subscribes.search(params[:q])
    @rt_activity_subscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_activity_subscribes)
  end

  def show
    respond_with(@rt_activity_subscribe) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_activity_subscribe)
  end

  def edit
  end

  def create
    @rt_activity_subscribe.save
    respond_with(@rt_activity_subscribe)
  end

  def update
    @rt_activity_subscribe.update_attributes(rt_activity_subscribe_params)
    respond_with(@rt_activity_subscribe)
  end

  def destroy
    @rt_activity_subscribe.destroy
    respond_with(@rt_activity_subscribe)
  end

  protected

    def rt_activity_subscribe_params
      params.require(:rt_activity_subscribe).permit(:name, :organizer, :description, :execution_date, :execution_hour, :road_type_id, :road_name, :number_type, :road_number, :postal_code, :borough, :district_id, :town, :province_id, :project_id, :notes)
    end
end
