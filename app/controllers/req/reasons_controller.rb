class Req::ReasonsController < ApplicationController

  load_and_authorize_resource instance_name: :req_reason
  respond_to :html, :js

  def index
    params[:q] ||= Req::Reason.ransack_default
    @search_q = @req_reasons.search(params[:q])
    @req_reasons = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@req_reasons)
  end

  def show
    respond_with(@req_reason) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@req_reason)
  end

  def edit
  end

  def create
    @req_reason.save
    respond_with(@req_reason)
  end

  def update
    @req_reason.update_attributes(req_reason_params)
    respond_with(@req_reason)
  end

  def destroy
    @req_reason.destroy
    respond_with(@req_reason)
  end

  protected

    def req_reason_params
      params.require(:req_reason).permit(:kind, :description, :active)
    end

    alias_method :create_params, :req_reason_params
end
