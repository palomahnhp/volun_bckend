class Rt::VolunteerUnsubscribesController < ApplicationController

  load_and_authorize_resource instance_name: :rt_volunteer_unsubscribe
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::VolunteerUnsubscribe.ransack_default
    @search_q = @rt_volunteer_unsubscribes.search(params[:q])
    @rt_volunteer_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteer_unsubscribes)
  end

  def show
    respond_with(@rt_volunteer_unsubscribe) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_volunteer_unsubscribe)
  end

  def edit
  end

  def create
    @rt_volunteer_unsubscribe.save
    respond_with(@rt_volunteer_unsubscribe, location: projects_path)
  end

  def update
    if @rt_volunteer_unsubscribe.update(rt_volunteer_unsubscribe_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_volunteer_unsubscribe.destroy
    respond_with(@rt_volunteer_unsubscribe)
  end

  protected

    def rt_volunteer_unsubscribe_params
      params
        .require(:rt_volunteer_unsubscribe)
        .permit(
          :volunteer_id,
          :level,
          :reason,
          request_form_attributes: request_form_attributes
        )
    end

   alias_method :create_params, :rt_volunteer_unsubscribe_params
end
