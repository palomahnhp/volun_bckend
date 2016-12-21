class EventsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Event.ransack_default
    @search_q = @events.search(params[:q])
    @events = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@events)
  end

  def show
    respond_with(@event) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event.save
    respond_with(@event)
  end

  def update
    @event.update_attributes(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  protected

    def event_params
      params.require(:event).permit(:eventable_id, :address_id)
    end
end
