class RequestReasonsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RequestReason.ransack_default
    @search_q = @request_reasons.search(params[:q])
    @request_reasons = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@request_reasons)
  end

  def show
    respond_with(@request_reason) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @request_reason = RequestReason.new
    respond_with(@request_reason)
  end

  def edit
  end

  def create
    @request_reason.save
    respond_with(@request_reason)
  end

  def update
    @request_reason.update_attributes(request_reason_params)
    respond_with(@request_reason)
  end

  def destroy
    @request_reason.destroy
    respond_with(@request_reason)
  end

  protected

    def request_reason_params
      params.require(:request_reason).permit(:kind, :description, :active)
    end
end
