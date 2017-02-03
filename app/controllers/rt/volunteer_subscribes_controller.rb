class Rt::VolunteerSubscribesController < ApplicationController

  load_and_authorize_resource instance_name: :rt_volunteer_subscribe
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::VolunteerSubscribe.ransack_default
    @search_q = @rt_volunteer_subscribes.search(params[:q])
    @rt_volunteer_subscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteer_subscribes)
  end

  def show
    respond_with(@rt_volunteer_subscribe) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_volunteer_subscribe)
  end

  def edit
  end

  def create
    @rt_volunteer_subscribe.save
    respond_with(@rt_volunteer_subscribe, location: projects_path)
  end

  def update
    if @rt_volunteer_subscribe.update(rt_volunteer_subscribe_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_volunteer_subscribe.destroy
    respond_with(@rt_volunteer_subscribe)
  end

  protected

    def rt_volunteer_subscribe_params
      params
        .require(:rt_volunteer_subscribe)
        .permit(
          :name,
          :last_name,
          :last_name_alt,
          :phone_number,
          :phone_number_alt,
          :email,
          request_form_attributes: request_form_attributes
        )
    end

  alias_method :create_params, :rt_volunteer_subscribe_params
end
