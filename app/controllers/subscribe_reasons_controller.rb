class SubscribeReasonsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= SubscribeReason.ransack_default
    @search_q = @subscribe_reasons.search(params[:q])
    @subscribe_reasons = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@subscribe_reasons)
  end

  def show
    respond_with(@subscribe_reason) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @subscribe_reason = SubscribeReason.new
    respond_with(@subscribe_reason)
  end

  def edit
  end

  def create
    @subscribe_reason.save
    respond_with(@subscribe_reason)
  end

  def update
    @subscribe_reason.update_attributes(subscribe_reason_params)
    respond_with(@subscribe_reason)
  end

  def destroy
    @subscribe_reason.destroy
    respond_with(@subscribe_reason)
  end

  protected

    def subscribe_reason_params
      params.require(:subscribe_reason).permit(:name, :active)
    end
end
