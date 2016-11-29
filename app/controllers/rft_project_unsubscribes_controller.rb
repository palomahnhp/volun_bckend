class RftProjectUnsubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftProjectUnsubscribe.ransack_default
    @search_q = @rft_project_unsubscribes.search(params[:q])
    @rft_project_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_project_unsubscribes)
  end

  def show
    respond_with(@rft_project_unsubscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_project_unsubscribe = RftProjectUnsubscribe.new
    respond_with(@rft_project_unsubscribe)
  end

  def edit
  end

  def create
    @rft_project_unsubscribe.save
    respond_with(@rft_project_unsubscribe)
  end

  def update
    @rft_project_unsubscribe.update_attributes(rft_project_unsubscribe_params)
    respond_with(@rft_project_unsubscribe)
  end

  def destroy
    @rft_project_unsubscribe.destroy
    respond_with(@rft_project_unsubscribe)
  end

  protected

    def rft_project_unsubscribe_params
      params.require(:rft_project_unsubscribe).permit(:request_form_type_id, :entity_id, :project_id, :reason)
    end
end
