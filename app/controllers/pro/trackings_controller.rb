class Pro::TrackingsController < ApplicationController

  load_and_authorize_resource instance_name: :pro_tracking
  respond_to :html, :js, :json

  def index
    params[:q] ||= Pro::Tracking.ransack_default
    if params[:tracked_record_id].nil?
      @project = session[:tracked_record_id]
    else
      @project = params[:tracked_record_id]
      session[:tracked_record_id] = @project
    end
    @search_q = @pro_trackings.search(params[:q])
    @pro_trackings = @search_q.result.where(project_id: @project).paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pro_trackings)
  end

  def show
    respond_with(@pro_tracking) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @pro_tracking = Pro::Tracking.new
    @pro_tracking.project_id = params[:tracked_record_id]
    respond_with(@pro_tracking)
  end

  def edit
  end

  def create
    @pro_tracking.save
    session[:tracked_record_id] = @pro_tracking.project_id
    respond_with(@pro_tracking)
  end

  def update
    @pro_tracking.update_attributes(pro_tracking_params)
    session[:tracked_record_id] = @pro_tracking.project_id
    respond_with(@pro_tracking)
  end

  def destroy
    @pro_tracking.destroy
    respond_with(@pro_tracking)
  end

  protected

    def pro_tracking_params
      params
        .require(:pro_tracking)
        .permit(
          :project_id,
          :tracked_at,
          :comments
        )
    end
    
  alias_method :create_params, :pro_tracking_params
    
end
