class Rt::ActivityPublishingsController < ApplicationController

  load_and_authorize_resource instance_name: :rt_activity_publishing
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::ActivityPublishing.ransack_default
    @search_q = @rt_activity_publishings.search(params[:q])
    @rt_activity_publishings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_activity_publishings)
  end

  def show
    respond_with(@rt_activity_publishing) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    respond_with(@rt_activity_publishing)
  end

  def edit
  end

  def create
    if @rt_activity_publishing.save
      redirect_to request_forms_path
    else
      render :new
    end
  end

  def update
    if @rt_activity_publishing.update(rt_activity_publishing_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_activity_publishing.destroy
    respond_with(@rt_activity_publishing)
  end

  protected

    def rt_activity_publishing_params
      params
        .require(:rt_activity_publishing)
        .permit(
          :name,
          :organizer,
          :description,
          :execution_date,
          :execution_hour,
          :road_type,
          :road_name,
          :number_type,
          :road_number,
          :postal_code,
          :town,
          :province,
          request_form_attributes: request_form_attributes
        )
    end

    alias_method :create_params, :rt_activity_publishing_params

end
