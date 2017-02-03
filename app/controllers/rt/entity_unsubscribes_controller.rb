class Rt::EntityUnsubscribesController < ApplicationController

  load_and_authorize_resource instance_name: :rt_entity_unsubscribe
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::EntityUnsubscribe.ransack_default
    @search_q = @rt_entity_unsubscribes.search(params[:q])
    @rt_entity_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_entity_unsubscribes)
  end

  def show
    respond_with(@rt_entity_unsubscribe) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_entity_unsubscribe)
  end

  def edit
  end

  def create
    @rt_entity_unsubscribe.save
    respond_with(@rt_entity_unsubscribe, location: projects_path)
  end

  def update
    if @rt_entity_unsubscribe.update(rt_entity_unsubscribe_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_entity_unsubscribe.destroy
    respond_with(@rt_entity_unsubscribe)
  end

  protected

    def rt_entity_unsubscribe_params
      params
        .require(:rt_entity_unsubscribe)
        .permit(:reason, request_form_attributes: request_form_attributes)
    end

    alias_method :create_params, :rt_entity_unsubscribe_params
end
