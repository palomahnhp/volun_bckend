class ActivitiesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Activity.ransack_default
    @search_q = @activities.search(params[:q])
    @search_q.sorts ||= 'id asc'
    @unpaginated_activities = @search_q.result.uniq
    @activities = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@activities) do |format|
      format.csv { send_data Activity.to_csv(@unpaginated_activities), filename: "#{Activity.model_name.human(count: 2)}.csv" }
    end
  end

  def show
    respond_with(@activity) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @activity = Activity.new
    respond_with(@activity)
  end

  def edit
  end

  def create
    @activity.save
    respond_with(@activity)
  end

  def update
    @activity.update_attributes(activity_params)
    respond_with(@activity)
  end

  def destroy
    @activity.destroy
    respond_with(@activity)
  end

  def recover
    @activity.recover
    respond_with(@activity)
  end

  protected

    def activity_params
      params
        .require(:activity)
        .permit(
          :name,
          :description,
          :start_date,
          :end_date,
          :transport,
          :pdf_url,
          :entity_id,
          :area_id,
          :project_id,
          :share,
          {
            events_attributes: [
              :id,
              {
                address_attributes: [
                  :id,
                  :road_type,
                  :road_name,
                  :road_number_type,
                  :road_number,
                  :grader,
                  :stairs,
                  :floor,
                  :door,
                  :postal_code,
                  :borough,
                  :district,
                  :town,
                  :province,
                  :country,
                  :normalize,
                  :_destroy
                ]
              },
              {
                timetables_attributes: [
                  :id,
                  :execution_date,
                  :start_hour,
                  :end_hour,
                  :_destroy
                ]
              },
              :_destroy
            ]
          }
      )
    end
end
