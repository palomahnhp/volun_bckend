class RftActivityUnpublishingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftActivityUnpublishing.ransack_default
    @search_q = @rft_activity_unpublishings.search(params[:q])
    @rft_activity_unpublishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_activity_unpublishings)
  end

  def show
    respond_with(@rft_activity_unpublishing) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_activity_unpublishing = RftActivityUnpublishing.new
    respond_with(@rft_activity_unpublishing)
  end

  def edit
  end

  def create
    @rft_activity_unpublishing.save
    respond_with(@rft_activity_unpublishing)
  end

  def update
    @rft_activity_unpublishing.update_attributes(rft_activity_unpublishing_params)
    respond_with(@rft_activity_unpublishing)
  end

  def destroy
    @rft_activity_unpublishing.destroy
    respond_with(@rft_activity_unpublishing)
  end

  protected

    def rft_activity_unpublishing_params
      params.require(:rft_activity_unpublishing).permit(:request_form_type_id, :entity_id, :reason)
    end
end
