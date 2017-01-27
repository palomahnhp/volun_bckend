class Rt::ProjectUnpublishingsController < ApplicationController

  load_and_authorize_resource instance_name: :rt_project_unpublishing
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::ProjectUnpublishing.ransack_default
    @search_q = @rt_project_unpublishings.search(params[:q])
    @rt_project_unpublishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_project_unpublishings)
  end

  def show
    respond_with(@rt_project_unpublishing) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_project_unpublishing)
  end

  def edit
  end

  def create
    if @rt_project_unpublishing.save
      redirect_to request_forms_path
    else
      render :new
    end
  end

  def update
    if @rt_project_unpublishing.update(rt_project_unpublishing_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_project_unpublishing.destroy
    respond_with(@rt_project_unpublishing)
  end

  protected

    def rt_project_unpublishing_params
      params
        .require(:rt_project_unpublishing)
        .permit(:reason,  request_form_attributes: request_form_attributes)
    end

    alias_method :create_params, :rt_project_unpublishing_params

end
