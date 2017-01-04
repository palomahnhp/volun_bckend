class Rt::ActivityUnpublishingsController < ApplicationController

  load_and_authorize_resource instance_name: :rt_activity_unpublishing
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::ActivityUnpublishing.ransack_default
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
    @rt_activity_unpublishing = Rt::ActivityUnpublishing.new
    respond_with(@rt_activity_unpublishing)
  end

  def edit
  end

  def create
    if @rt_activity_unpublishing.save
      redirect_to request_forms_path
    else
      render :new
    end
  end

  def update
    if @rt_activity_unpublishing.update(rt_activity_publishing_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_activity_unpublishing.destroy
    respond_with(@rt_activity_unpublishing)
  end

  protected

    def rt_activity_unpublishing_params
      params
        .require(:rt_activity_unpublishing)
        .permit(:reason, request_form_attributes: request_form_attributes)
    end

    alias_method :create_params, :rt_activity_unpublishing_params
end
