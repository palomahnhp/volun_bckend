class Rt::VolunteerSubscribesController < ApplicationController

  load_and_authorize_resource instance_name: :rt_volunteer_subscribe

  before_action :set_statuses, only: :index

  respond_to :html, :js

  def index
    params[:q] ||= Rt::VolunteerSubscribe.ransack_default
    @search_q = @rt_volunteer_subscribes
                  .with_statuses(statuses.select{|status| params[status]})
                  .search(params[:q])
    @rt_volunteer_subscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteer_subscribes)
  end

  def show
    respond_with(@rt_volunteer_subscribe) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  # def new
  #   respond_with(@rt_volunteer_subscribe)
  # end

  def edit
  end

  # def create
  #   @rt_volunteer_subscribe.save
  #   respond_with(@rt_volunteer_subscribe)
  # end

  def update
    @rt_volunteer_subscribe.update(rt_volunteer_subscribe_params)
    respond_with(@rt_volunteer_subscribe)
  end

  def destroy
    @rt_volunteer_subscribe.destroy
    respond_with(@rt_volunteer_subscribe)
  end

  def set_to_processing
    @rt_volunteer_subscribe.request_form.processing!
    redirect_to :edit
  end

  protected

    def rt_volunteer_subscribe_params
      params
        .require(:rt_volunteer_subscribe)
        .permit(
          :name,
          :last_name,
          :last_name_alt,
          :phone_number,
          :phone_number_alt,
          :email,
          request_form_attributes: request_form_attributes
        )
    end

    alias_method :create_params, :rt_volunteer_subscribe_params

    def set_statuses
      params[:pending]    ||= 'true'
      params[:processing] ||= 'true'

      statuses.each do |status|
        params[status] = cast_as_boolean params[status]
      end
    end

    def statuses
      @statuses ||= RequestForm.statuses.keys << :all
    end
end
