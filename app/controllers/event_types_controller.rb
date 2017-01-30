class EventTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= EventType.ransack_default
    @search_q = @event_types.search(params[:q])
    @event_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@event_types)
  end

  def show
    respond_with(@event_type) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @event_type = EventType.new
    respond_with(@event_type)
  end

  def edit
  end

  def create
    @event_type.save
    respond_with(@event_type)
  end

  def update
    @event_type.update_attributes(event_type_params)
    respond_with(@event_type)
  end

  def destroy
    @event_type.destroy
    respond_with(@event_type)
  end

  protected

    def event_type_params
      params.require(:event_type).permit(:kind, :description)
    end
end
