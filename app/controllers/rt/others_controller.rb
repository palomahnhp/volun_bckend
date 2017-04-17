class Rt::OthersController < ApplicationController

  load_and_authorize_resource instance_name: :rt_other
  
  include RtController
  
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::Other.ransack_default
    @search_q = @rt_others
                  .with_statuses(statuses.select{|status| params[status]})
                  .search(params[:q])
    @rt_others = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)
    respond_with(@rt_others)
  end

  def show
    respond_with(@rt_other) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_other)
  end

  def edit
  end

  def create
    @rt_other.save
    respond_with(@rt_other, location: request_forms_path)
  end

  def update
    @rt_other.update(rt_other_params)
    respond_with(@rt_other, location: request_forms_path)
  end

  def destroy
    @rt_other.destroy
    respond_with(@rt_other)
  end
  
  def process_request_form
    status_manager = RtController::StatusManager.new(request_form: @rt_other.request_form,
                                                     manager_id: current_user.loggable_id)
    @request_form = @rt_other.request_form
    unless status_manager.process_request_form
      redirect_to rt_others_path, alert: status_manager.show_errors
    end
  end

  def pre_approve_request_form
    if request_form.processing?
      approve_request_form
      respond_to do |format|
        format.html { redirect_to(rt_others_url, notice: I18n.t('messages.request_form_successfully_managed')) }
        format.js
      end
    else
      @request_form = request_form
      flash[:alert] = I18n.t('errors.request_form_must_be_at_processing')
      render :process_request_form
    end
  end

  def pre_reject_request_form
    @request_form = @rt_other.request_form
  end

  def reject_request_form
    status_manager = RtController::StatusManager.new((params[:request_form]).merge(manager_id: current_user.loggable_id))
    if status_manager.reject_request_form
      redirect_to rt_others_path, notice: I18n.t('messages.request_form_successfully_rejected')
    else
      @request_form = status_manager.request_form
      flash[:alert] = status_manager.show_errors
      render :pre_reject_request_form
    end
  end

  def mark_request_form_as_pending
    status_manager = RtController::StatusManager.new(request_form: @rt_other.request_form,
                                                     manager_id: current_user.loggable_id)
    if status_manager.mark_request_form_as_pending
      redirect_to rt_others_path, notice: I18n.t('messages.request_form_successfully_marked_as_pending')
    else
      flash[:alert] = status_manager.show_errors
      redirect_to :back
    end
  end

  protected

    def rt_other_params
      params
        .require(:rt_other)
        .permit(:description, request_form_attributes: request_form_attributes)
    end

    alias_method :create_params, :rt_other_params

    def request_form
      @rt_other.request_form
    end

    def approve_request_form
      unless request_form.update_and_trace_status(:approved, manager_id: current_user.loggable_id, user_id: current_user.loggable_id)
        copy_errors_from!(request_form)
      end
    end

end
