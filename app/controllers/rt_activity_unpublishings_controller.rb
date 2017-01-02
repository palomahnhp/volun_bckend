class RtActivityUnpublishingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtActivityUnpublishing.ransack_default
    @search_q = @rt_activity_unpublishings.search(params[:q])
    @rt_activity_unpublishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_activity_unpublishings)
  end

  def show
    respond_with(@rt_activity_unpublishing) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rt_activity_unpublishing = RtActivityUnpublishing.new
    respond_with(@rt_activity_unpublishing)
  end

  def edit
  end

  def create
    @rt_activity_unpublishing.save
    respond_with(@rt_activity_unpublishing)
  end

  def update
    @rt_activity_unpublishing.update_attributes(rt_activity_unpublishing_params)
    respond_with(@rt_activity_unpublishing)
  end

  def destroy
    @rt_activity_unpublishing.destroy
    respond_with(@rt_activity_unpublishing)
  end

  protected

    def rt_activity_unpublishing_params
      params.require(:rt_activity_unpublishing).permit(:reason)
    end
end
