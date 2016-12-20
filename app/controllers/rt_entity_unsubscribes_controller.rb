class RtEntityUnsubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtEntityUnsubscribe.ransack_default
    @search_q = @rt_entity_unsubscribes.search(params[:q])
    @rt_entity_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_entity_unsubscribes)
  end

  def show
    respond_with(@rt_entity_unsubscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def edit
  end

  def update
    @rt_entity_unsubscribe.update_attributes(rt_entity_unsubscribe_params)
    respond_with(@rt_entity_unsubscribe)
  end

  protected

    def rt_entity_unsubscribe_params
      params.require(:rt_entity_unsubscribe).permit(:reason)
    end
end
