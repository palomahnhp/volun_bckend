class TimetablesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Timetable.ransack_default
    @search_q = @timetables.search(params[:q])
    @timetables = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@timetables)
  end

  def show
    respond_with(@timetable) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @timetable = Timetable.new
    respond_with(@timetable)
  end

  def edit
  end

  def create
    @timetable.save
    respond_with(@timetable)
  end

  def update
    @timetable.update_attributes(timetable_params)
    respond_with(@timetable)
  end

  def destroy
    @timetable.destroy
    respond_with(@timetable)
  end

  protected

    def timetable_params
      params.require(:timetable).permit(:event_id, :execution_date, :start_hour, :end_hour)
    end
end
