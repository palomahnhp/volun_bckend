class ResourcesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= Resource.ransack_default
    @search_q = @resources.search(params[:q])
    @resources = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@resources)
  end

  def show
    respond_with(@resource) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@resource)
  end

  def edit
  end

  def create
    @resource.save
    respond_with(@resource)
  end

  def update
    @resource.update_attributes(resource_params)
    respond_with(@resource)
  end

  def destroy
    @resource.destroy
    respond_with(@resource)
  end

  def recover
    @resource.recover
    respond_with(@resource)
  end

  protected

    def resource_params
      params.require(:resource).permit(:description, :active, :main)
    end
end
