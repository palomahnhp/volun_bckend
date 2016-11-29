class RftProjectUnpublishingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftProjectUnpublishing.ransack_default
    @search_q = @rft_project_unpublishings.search(params[:q])
    @rft_project_unpublishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_project_unpublishings)
  end

  def show
    respond_with(@rft_project_unpublishing) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_project_unpublishing = RftProjectUnpublishing.new
    respond_with(@rft_project_unpublishing)
  end

  def edit
  end

  def create
    @rft_project_unpublishing.save
    respond_with(@rft_project_unpublishing)
  end

  def update
    @rft_project_unpublishing.update_attributes(rft_project_unpublishing_params)
    respond_with(@rft_project_unpublishing)
  end

  def destroy
    @rft_project_unpublishing.destroy
    respond_with(@rft_project_unpublishing)
  end

  protected

    def rft_project_unpublishing_params
      params.require(:rft_project_unpublishing).permit(:request_form_type_id, :entity_id, :reason)
    end
end
