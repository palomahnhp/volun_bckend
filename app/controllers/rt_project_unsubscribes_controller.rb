class RtProjectUnsubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtProjectUnsubscribe.ransack_default
    @search_q = @rt_project_unsubscribes.search(params[:q])
    @rt_project_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_project_unsubscribes)
  end

  def show
    respond_with(@rt_project_unsubscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def edit
  end

  def update
    @rt_project_unsubscribe.update_attributes(rt_project_unsubscribe_params)
    respond_with(@rt_project_unsubscribe)
  end

  protected

    def rt_project_unsubscribe_params
      params.require(:rt_project_unsubscribe).permit(:project_id, :reason)
    end
end
