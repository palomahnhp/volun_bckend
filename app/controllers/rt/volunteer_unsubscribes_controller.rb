class Rt::VolunteerUnsubscribesController < ApplicationController

  load_and_authorize_resource instance_name: :rt_volunteer_unsubscribe
  
  include RtController
  
  respond_to :html, :js

  def index
    params[:q] ||= Rt::VolunteerUnsubscribe.ransack_default
    @search_q = @rt_volunteer_unsubscribes
                  .with_statuses(statuses.select{|status| params[status]})
                  .search(params[:q])
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
    respond_with(@rt_volunteer_unsubscribe, location: request_forms_path)
  end

  def update
    @rt_volunteer_unsubscribe.update(rt_volunteer_unsubscribe_params)
    respond_with(@rt_volunteer_unsubscribe, location: request_forms_path)
  end

  def destroy
    @rt_volunteer_unsubscribe.destroy
    respond_with(@rt_volunteer_unsubscribe)
  end

  def process_request_form
    status_manager = RtController::StatusManager.new(request_form: @rt_volunteer_unsubscribe.request_form,
                                                     manager_id: current_user.loggable_id)
    @request_form = @rt_volunteer_unsubscribe.request_form
    unless status_manager.process_request_form
      redirect_to rt_volunteer_unsubscribes_path, alert: status_manager.show_errors
    end
  end

  def pre_approve_request_form
    if @rt_volunteer_unsubscribe.request_form.processing?
      redirect_to edit_volunteer_path(@rt_volunteer_unsubscribe.request_form.user.loggable, rt_volunteer_unsubscribe_id: @rt_volunteer_unsubscribe.id)
    else
      flash[:alert] = 'status_manager.show_errors'
      redirect_to :back
    end
  end

  def pre_reject_request_form
    @request_form = @rt_volunteer_unsubscribe.request_form
  end

  def reject_request_form
    status_manager = RtController::StatusManager.new((params[:request_form]).merge(manager_id: current_user.loggable_id))
    if status_manager.reject_request_form
      redirect_to rt_volunteer_unsubscribes_path, notice: I18n.t('messages.request_form_successfully_rejected')
    else
      @request_form = status_manager.request_form
      flash[:alert] = status_manager.show_errors
      render :pre_reject_request_form
    end
  end

  def mark_request_form_as_pending
    status_manager = RtController::StatusManager.new(request_form: @rt_volunteer_unsubscribe.request_form,
                                                     manager_id: current_user.loggable_id)
    if status_manager.mark_request_form_as_pending
      redirect_to rt_volunteer_unsubscribes_path, notice: I18n.t('messages.request_form_successfully_marked_as_pending')
    else
      flash[:alert] = status_manager.show_errors
      redirect_to :back
    end
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
