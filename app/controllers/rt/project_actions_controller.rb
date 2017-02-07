class Rt::ProjectActionsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= Rt::ProjectAction.ransack_default
    @search_q = @rt_project_actions.search(params[:q])
    @rt_project_actions = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_project_actions)
  end

  def show
    respond_with(@rt_project_action) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_project_action)
  end

  def edit
  end

  def create
    @rt_project_action.save
    respond_with(@rt_project_action)
  end

  def update
    @rt_project_action.update_attributes(rt_project_action_params)
    respond_with(@rt_project_action)
  end

  def destroy
    @rt_project_action.destroy
    respond_with(@rt_project_action)
  end

  protected

    def rt_project_action_params
      params.require(:rt_project_action).permit(:project_id, :operation_type_id, :notes)
    end
end
