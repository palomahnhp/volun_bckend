class RtVolunteerUnsubscribesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtVolunteerUnsubscribe.ransack_default
    @search_q = @rt_volunteer_unsubscribes.search(params[:q])
    @rt_volunteer_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteer_unsubscribes)
  end

  def show
    respond_with(@rt_volunteer_unsubscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rt_volunteer_unsubscribe = RtVolunteerUnsubscribe.new
    respond_with(@rt_volunteer_unsubscribe)
  end

  def edit
  end

  def create
    @rt_volunteer_unsubscribe.save
    respond_with(@rt_volunteer_unsubscribe)
  end

  def update
    @rt_volunteer_unsubscribe.update_attributes(rt_volunteer_unsubscribe_params)
    respond_with(@rt_volunteer_unsubscribe)
  end

  def destroy
    @rt_volunteer_unsubscribe.destroy
    respond_with(@rt_volunteer_unsubscribe)
  end

  protected

    def rt_volunteer_unsubscribe_params
      params.require(:rt_volunteer_unsubscribe).permit(:volunteer_id, :level, :reason)
    end
end
