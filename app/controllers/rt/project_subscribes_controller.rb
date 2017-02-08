class Rt::ProjectSubscribesController < ApplicationController

  load_and_authorize_resource instance_name: :rt_project_subscribe
  respond_to :html, :js

  def index
    params[:q] ||= Rt::ProjectSubscribe.ransack_default
    @search_q = @rt_project_subscribes.search(params[:q])
    @rt_project_subscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_project_subscribes)
  end

  def show
    respond_with(@rt_project_subscribe) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_project_subscribe)
  end

  def edit
  end

  def create
    @rt_project_subscribe.save
    respond_with(@rt_project_subscribe, location: request_forms_path)
  end

  def update
    @rt_project_subscribe.update_attributes(rt_project_subscribe_params)
    respond_with(@rt_project_subscribe, location: request_forms_path)
  end

  def destroy
    @rt_project_subscribe.destroy
    respond_with(@rt_project_subscribe)
  end

  protected

    def rt_project_subscribe_params
      params
        .require(:rt_project_subscribe)
        .permit(
          :description,
          :road_type_id,
          :road_name,
          :number_type,
          :road_number,
          :postal_code,
          :borough,
          :district_id,
          :town,
          :province_id,
          :notes)
    end

    alias_method :create_params, :rt_project_subscribe_params
end
