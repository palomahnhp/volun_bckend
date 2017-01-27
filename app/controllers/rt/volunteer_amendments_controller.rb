class Rt::VolunteerAmendmentsController < ApplicationController

  load_and_authorize_resource instance_name: :rt_volunteer_amendment
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::VolunteerAmendment.ransack_default
    @search_q = @rt_volunteer_amendments.search(params[:q])
    @rt_volunteer_amendments = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteer_amendments)
  end

  def show
    respond_with(@rt_volunteer_amendment) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_volunteer_amendment)
  end

  def edit
  end

  def create
    if @rt_volunteer_amendment.save
      redirect_to request_forms_path
    else
      render :new
    end
  end

  def update
    if @rt_volunteer_amendment.update(rt_volunteer_amendment_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_volunteer_amendment.destroy
    respond_with(@rt_volunteer_amendment)
  end

  protected

    def rt_volunteer_amendment_params
      params
        .require(:rt_volunteer_amendment)
        .permit(
          :volunteer_id,
          :address_id,
          :phone_number,
          :phone_number_alt,
          request_form_attributes: request_form_attributes
        )
    end

    alias_method :create_params, :rt_volunteer_amendment_params
end
