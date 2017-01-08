class Rt::ProjectUnsubscribesController < ApplicationController

  load_and_authorize_resource instance_name: :rt_project_unsubscribe
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::ProjectUnsubscribe.ransack_default
    @search_q = @rt_project_unsubscribes.search(params[:q])
    @rt_project_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_project_unsubscribes)
  end

  def show
    respond_with(@rt_project_unsubscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    respond_with(@rt_project_unsubscribe)
  end

  def edit
  end

  def create
    if @rt_project_unsubscribe.save
      redirect_to request_forms_path
    else
      render :new
    end
  end

  def update
    if @rt_project_unsubscribe.update(rt_project_unsubscribe_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_project_unsubscribe.destroy
    respond_with(@rt_project_unsubscribe)
  end

  protected

    def rt_project_unsubscribe_params
      params
        .require(:rt_project_unsubscribe)
        .permit(
          :project_id,
          :reason,
          request_form_attributes: request_form_attributes
        )
    end

    alias_method :create_params, :rt_project_unsubscribe_params
end
