class Rt::EntitySubscribesController < ApplicationController

  load_and_authorize_resource instance_name: :rt_entity_subscribe
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::EntitySubscribe.ransack_default
    @search_q = @rt_entity_subscribes.search(params[:q])
    @rt_entity_subscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_entity_subscribes)
  end

  def show
    respond_with(@rt_entity_subscribe) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @rt_entity_subscribe = Rt::EntitySubscribe.new
    respond_with(@rt_entity_subscribe)
  end

  def edit
  end

  def create
    @rt_entity_subscribe.save
    respond_with(@rt_entity_subscribe, location: projects_path)
  end

  def update
    if @rt_entity_subscribe.update(rt_entity_subscribe_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_entity_subscribe.destroy
    respond_with(@rt_entity_subscribe)
  end

  protected

    def rt_entity_subscribe_params
      params
        .require(:rt_entity_subscribe)
        .permit(
          :name,
          :vat_number,
          :email,
          :contact_name,
          :contact_last_name,
          :contact_last_name_alt,
          :representative_name,
          :representative_last_name,
          :representative_last_name_alt,
          :phone_number,
          :phone_number_alt,
          :road_type,
          :road_name,
          :number_type,
          :road_number,
          :postal_code,
          :town,
          :province,
          :request_reason_id,
          request_form_attributes: request_form_attributes
        )
    end

    alias_method :create_params, :rt_entity_subscribe_params
end
