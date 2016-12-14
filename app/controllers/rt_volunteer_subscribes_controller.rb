class RtVolunteerSubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtVolunteerSubscribe.ransack_default
    @search_q = @rt_volunteer_subscribes.search(params[:q])
    @rt_volunteer_subscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteer_subscribes)
  end

  def show
    respond_with(@rt_volunteer_subscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def edit
  end

  def update
    @rt_volunteer_subscribe.update_attributes(rt_volunteer_subscribe_params)
    respond_with(@rt_volunteer_subscribe)
  end

  protected

    def rt_volunteer_subscribe_params
      params.require(:rt_volunteer_subscribe).permit(:name, :first_surname, :second_surname, :phone_number, :phone_number_alt, :email)
    end
end
