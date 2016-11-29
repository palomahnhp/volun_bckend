class RftEntityUnsubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftEntityUnsubscribe.ransack_default
    @search_q = @rft_entity_unsubscribes.search(params[:q])
    @rft_entity_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_entity_unsubscribes)
  end

  def show
    respond_with(@rft_entity_unsubscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_entity_unsubscribe = RftEntityUnsubscribe.new
    respond_with(@rft_entity_unsubscribe)
  end

  def edit
  end

  def create
    @rft_entity_unsubscribe.save
    respond_with(@rft_entity_unsubscribe)
  end

  def update
    @rft_entity_unsubscribe.update_attributes(rft_entity_unsubscribe_params)
    respond_with(@rft_entity_unsubscribe)
  end

  def destroy
    @rft_entity_unsubscribe.destroy
    respond_with(@rft_entity_unsubscribe)
  end

  protected

    def rft_entity_unsubscribe_params
      params.require(:rft_entity_unsubscribe).permit(:request_form_type_id, :entity_id, :reason)
    end
end
