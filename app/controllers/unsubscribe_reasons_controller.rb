class UnsubscribeReasonsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= UnsubscribeReason.ransack_default
    @search_q = @unsubscribe_reasons.search(params[:q])
    @unsubscribe_reasons = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@unsubscribe_reasons)
  end

  def show
    respond_with(@unsubscribe_reason) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @unsubscribe_reason = UnsubscribeReason.new
    respond_with(@unsubscribe_reason)
  end

  def edit
  end

  def create
    @unsubscribe_reason.save
    respond_with(@unsubscribe_reason)
  end

  def update
    @unsubscribe_reason.update_attributes(unsubscribe_reason_params)
    respond_with(@unsubscribe_reason)
  end

  def destroy
    @unsubscribe_reason.destroy
    respond_with(@unsubscribe_reason)
  end

  def recover
    @unsubscribe_reason.recover
    respond_with(@unsubscribe_reason)
  end

  protected

    def unsubscribe_reason_params
      params.require(:unsubscribe_reason).permit(:name, :active)
    end
end
