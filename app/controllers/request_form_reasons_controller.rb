class RequestFormReasonsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RequestFormReason.ransack_default
    @search_q = @request_form_reasons.search(params[:q])
    @request_form_reasons = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@request_form_reasons)
  end

  def show
    respond_with(@request_form_reason) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @request_form_reason = RequestFormReason.new
    respond_with(@request_form_reason)
  end

  def edit
  end

  def create
    @request_form_reason.save
    respond_with(@request_form_reason)
  end

  def update
    @request_form_reason.update_attributes(request_form_reason_params)
    respond_with(@request_form_reason)
  end

  def destroy
    @request_form_reason.destroy
    respond_with(@request_form_reason)
  end

  protected

    def request_form_reason_params
      params.require(:request_form_reason).permit(:kind, :description, :active)
    end
end
