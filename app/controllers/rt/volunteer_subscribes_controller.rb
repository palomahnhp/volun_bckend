class Rt::VolunteerSubscribesController < ApplicationController

  load_and_authorize_resource instance_name: :rt_volunteer_subscribe

  include RtController

  respond_to :html, :js

  def index
    params[:q] ||= Rt::VolunteerSubscribe.ransack_default
    @search_q = @rt_volunteer_subscribes
                  .with_statuses(statuses.select{|status| params[status]})
                  .search(params[:q])
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
    respond_with(@rt_volunteer_subscribe)
  end

  def update
    @rt_volunteer_subscribe.update(rt_volunteer_subscribe_params)
    respond_with(@rt_volunteer_subscribe)
  end

  def destroy
    @rt_volunteer_subscribe.destroy
    respond_with(@rt_volunteer_subscribe)
  end

  def process_request_form
    update_request_form_status(:processing, @rt_volunteer_subscribe.request_form)
  end

  def pre_approve_request_form
    session[:rt_volunteer_subscribe_id] = @rt_volunteer_subscribe.id
    redirect_to new_volunteer_path(volunteer: @rt_volunteer_subscribe.volunteer_attributes)
  end

  def pre_reject_request_form
  end

  def reject_request_form
    rejection_type = Req::RejectionType.find_by(id: rt_volunteer_subscribe_params.dig(:request_form_attributes, :req_rejection_type_id).to_i)
    if rejection_type
      update_request_form_status(
        :rejected,
        @rt_volunteer_subscribe.request_form,
        req_rejection_type_id: rejection_type.id
      )
      flash[:notice] = "Solicitud rechazada con éxito"
      redirect_to rt_volunteer_subscribes_path
    else
      flash[:error] = "Debe seleccionar un motivo de rechazo"
      render :pre_reject_request_form
    end
  end

  def mark_request_form_as_pending
    update_request_form_status(:pending, @rt_volunteer_subscribe.request_form)
    redirect_to rt_volunteer_subscribes_path
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
