class Req::StatusTracesController < ApplicationController

  load_and_authorize_resource instance_name: :req_status_trace
  respond_to :html, :js

  def index
    params[:q] ||= Req::StatusTrace.ransack_default
    @search_q = @req_status_traces.search(params[:q])
    @req_status_traces = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@req_status_traces)
  end

  def show
    respond_with(@req_status_trace) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@req_status_trace)
  end

  def edit
  end

  def create
    @req_status_trace.save
    respond_with(@req_status_trace)
  end

  def update
    @req_status_trace.update_attributes(req_status_trace_params)
    respond_with(@req_status_trace)
  end

  def destroy
    @req_status_trace.destroy
    respond_with(@req_status_trace)
  end

  protected

    def req_status_trace_params
      params.require(:req_status_trace).permit(:req_status_id, :request_form_id, :manager_id)
    end

    alias_method :create_params, :req_status_trace_params
end
