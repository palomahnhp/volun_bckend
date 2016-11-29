class RftEntitySubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftEntitySubscribe.ransack_default
    @search_q = @rft_entity_subscribes.search(params[:q])
    @rft_entity_subscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_entity_subscribes)
  end

  def show
    respond_with(@rft_entity_subscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_entity_subscribe = RftEntitySubscribe.new
    respond_with(@rft_entity_subscribe)
  end

  def edit
  end

  def create
    @rft_entity_subscribe.save
    respond_with(@rft_entity_subscribe)
  end

  def update
    @rft_entity_subscribe.update_attributes(rft_entity_subscribe_params)
    respond_with(@rft_entity_subscribe)
  end

  def destroy
    @rft_entity_subscribe.destroy
    respond_with(@rft_entity_subscribe)
  end

  protected

    def rft_entity_subscribe_params
      params.require(:rft_entity_subscribe).permit(:request_form_type_id, :entity_id, :name, :vat_num, :email, :contact_name, :contact_first_surname, :contact_second_surname, :representative_name, :representative_first_surname, :representative_second_surname, :phone_number, :phone_number_alt, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province)
    end
end
