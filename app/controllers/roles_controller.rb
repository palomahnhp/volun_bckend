class RolesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= Role.ransack_default
    @search_q = @roles.search(params[:q])
    @roles = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@roles)
  end

  def show
    respond_with(@role) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@role)
  end

  def edit
  end

  def create
    @role.save
    respond_with(@role)
  end

  def update
    @role.update_attributes(role_params)
    respond_with(@role)
  end

  def destroy
    @role.destroy
    respond_with(@role)
  end

  protected

    def role_params
      params.require(:role).permit(:kind, :description)
    end
end
