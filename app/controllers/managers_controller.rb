class ManagersController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Manager.ransack_default
    @search_q = @managers.search(params[:q])
    @managers = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@managers)
  end

  def show
    respond_with(@manager) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @manager = Manager.new
    respond_with(@manager)
  end

  def edit
  end

  def create
    @manager.save
    respond_with(@manager)
  end

  def update
    @manager.update_attributes(manager_params)
    respond_with(@manager)
  end

  def destroy
    @manager.destroy
    respond_with(@manager)
  end

  protected

    def manager_params
      params.require(:manager).permit(:name, :profile_id, :phone_number, :active)
    end
end
