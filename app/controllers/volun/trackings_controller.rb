class Volun::TrackingsController < ApplicationController

  load_and_authorize_resource instance_name: :volun_tracking
  respond_to :html, :js, :json

  def index
    params[:q] ||= Volun::Tracking.ransack_default
    @search_q = @volun_trackings.search(params[:q])
    if params[:project_id_assoc].present?
      @volun_trackings = @search_q.result.where(project_id: params[:project_id]).paginate(page: params[:page], per_page: params[:per_page]||15)
    else
      @volun_trackings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)
    end

    respond_with(@volun_trackings)
  end

  def show
    respond_with(@volun_tracking) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    volunteer = Volunteer.find_by(id: params[:volunteer_id])
    @volun_tracking = volunteer.trackings.build
    @volun_tracking.project_id = params[:project_id_assoc]
    respond_with(@volun_tracking)
  end

  def edit
  end

  def create
    @volun_tracking.save
    respond_with(@volun_tracking, location: volun_trackings_path(q: { volunteer_id_eq: @volun_tracking.volunteer_id}, project_id_assoc: params[:project_id_assoc]))
  end

  def update
    @volun_tracking.update_attributes(volun_tracking_params)
    respond_with(@volun_tracking, location: volun_trackings_path(q: { volunteer_id_eq: @volun_tracking.volunteer_id}, project_id_assoc: params[:project_id_assoc]))
  end

  def destroy
    @volun_tracking.destroy
    respond_with(@volun_tracking)
  end

  protected

    def volun_tracking_params
      params
        .require(:volun_tracking)
        .permit(
          :volunteer_id,
          :tracking_type_id,
          :project_id,
          :manager_id,
          :tracked_at,
          :comments,
          :project_id_assoc
        )
    end

  alias_method :create_params, :volun_tracking_params

end
