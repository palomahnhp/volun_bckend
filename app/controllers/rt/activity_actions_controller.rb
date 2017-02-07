class Rt::ActivityActionsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= Rt::ActivityAction.ransack_default
    @search_q = @rt_activity_actions.search(params[:q])
    @rt_activity_actions = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_activity_actions)
  end

  def show
    respond_with(@rt_activity_action) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_activity_action)
  end

  def edit
  end

  def create
    @rt_activity_action.save
    respond_with(@rt_activity_action)
  end

  def update
    @rt_activity_action.update_attributes(rt_activity_action_params)
    respond_with(@rt_activity_action)
  end

  def destroy
    @rt_activity_action.destroy
    respond_with(@rt_activity_action)
  end

  protected

    def rt_activity_action_params
      params.require(:rt_activity_action).permit(:activity_id, :operation_type_id, :notes)
    end
end
