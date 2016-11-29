class ProjectAddressesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProjectAddress.ransack_default
    @search_q = @project_addresses.search(params[:q])
    @project_addresses = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@project_addresses)
  end

  def show
    respond_with(@project_address) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @project_address = ProjectAddress.new
    respond_with(@project_address)
  end

  def edit
  end

  def create
    @project_address.save
    respond_with(@project_address)
  end

  def update
    @project_address.update_attributes(project_address_params)
    respond_with(@project_address)
  end

  def destroy
    @project_address.destroy
    respond_with(@project_address)
  end

  def recover
    @project_address.recover
    respond_with(@project_address)
  end

  protected

    def project_address_params
      params.require(:project_address).permit(:project_id, :address_id)
    end
end
