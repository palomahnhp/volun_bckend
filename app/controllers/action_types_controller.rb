class ActionTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= ActionType.ransack_default
    @search_q = @action_types.search(params[:q])
    @action_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@action_types)
  end

  def show
    respond_with(@action_type) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@action_type)
  end

  def edit
  end

  def create
    @action_type.save
    respond_with(@action_type)
  end

  def update
    @action_type.update_attributes(action_type_params)
    respond_with(@action_type)
  end

  def destroy
    @action_type.destroy
    respond_with(@action_type)
  end

  protected

    def action_type_params
      params.require(:action_type).permit(:kind, :description)
    end
end
