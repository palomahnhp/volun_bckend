class Req::StatusesController < ApplicationController

  load_and_authorize_resource instance_name: :req_status
  respond_to :html, :js

  def index
    params[:q] ||= Req::Status.ransack_default
    @search_q = @req_statuses.search(params[:q])
    @req_statuses = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@req_statuses)
  end

  def show
    respond_with(@req_status) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@req_status)
  end

  def edit
  end

  def create
    @req_status.save
    respond_with(@req_status)
  end

  def update
    @req_status.update_attributes(req_status_params)
    respond_with(@req_status)
  end

  def destroy
    @req_status.destroy
    respond_with(@req_status)
  end

  protected

    def req_status_params
      params.require(:req_status).permit(:kind, :description)
    end

    alias_method :create_params, :req_status_params
end
