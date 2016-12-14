class RtEntitySubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtEntitySubscribe.ransack_default
    @search_q = @rt_entity_subscribes.search(params[:q])
    @rt_entity_subscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_entity_subscribes)
  end

  def show
    respond_with(@rt_entity_subscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def edit
  end

  def update
    @rt_entity_subscribe.update_attributes(rt_entity_subscribe_params)
    respond_with(@rt_entity_subscribe)
  end

  protected

    def rt_entity_subscribe_params
      params.require(:rt_entity_subscribe).permit(:name, :vat_num, :email, :contact_name, :contact_first_surname, :contact_second_surname, :representative_name, :representative_first_surname, :representative_second_surname, :phone_number, :phone_number_alt, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province)
    end
end
