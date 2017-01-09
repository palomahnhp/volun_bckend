class StatusesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Status.ransack_default
    @search_q = @statuses.search(params[:q])
    @statuses = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@statuses)
  end

  def show
    respond_with(@status) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @status = Status.new
    respond_with(@status)
  end

  def edit
  end

  def create
    @status.save
    respond_with(@status)
  end

  def update
    @status.update_attributes(status_params)
    respond_with(@status)
  end

  def destroy
    @status.destroy
    respond_with(@status)
  end

  protected

    def status_params
      params.require(:status).permit(:name, :active)
    end
end
