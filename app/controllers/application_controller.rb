require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate!, unless: 'user_authenticated?'
  before_action :block_devise_views, unless: 'use_devise_authentication?'
  before_action :set_page_params, only: [:index]
  after_action :update_record_history, only: [:create, :update, :destroy], unless: 'devise_controller?'

  helper_method :use_devise_authentication?, :cast_as_boolean

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.html { redirect_to root_path, alert: I18n.t('messages.access_denied') }
      format.json { render json: {error: I18n.t('messages.access_denied')}, status: :forbidden }
    end
  end

  def cast_as_boolean(boolean_string)
    ActiveRecord::Type::Boolean.new.type_cast_from_user boolean_string
  end

  def uweb_authenticated?
    return true unless new_login?

    session[:current_user_id] = nil
    uweb_auth = UwebAuthenticator.new(params)
    if uweb_auth.authenticate
      session[:uweb_user_data]  = uweb_auth.uweb_user_data
    else
      flash.now[:error] = "#{I18n.t('errors.cannot_log_in')}: #{uweb_auth.errors.to_sentence}"
    end
    session[:uweb_user_data].present?
  end

  def new_login?
    session[:uweb_user_data].blank? || params[:login].present? && session[:uweb_user_data][:login] != params[:login]
  end

  private

  def update_record_history
    return unless recordable?
    record = instance_variable_get("@#{model.model_name.singular}")
    record.update_history(current_user.try(:id))
  end

  def recordable?
    model && model.included_modules.map(&:to_s).include?('Recordable')
  end

  def model
    @model ||= controller_name.classify.safe_constantize
  end

  def authenticate!
    if use_devise_authentication?
      redirect_to new_user_session_path unless devise_controller?
    else
      render file: 'public/401.html', status: :unauthorized unless uweb_authenticated?
    end
  end

  def block_devise_views
    redirect_to root_path if devise_controller?
  end

  def user_authenticated?
    session[:uweb_user_data] = {} if use_devise_authentication?
    current_user.present?
  end

  def use_devise_authentication?
    cast_as_boolean Setting['devise_auth']
  end

  # Devise: Where to redirect users once they have logged in
  def after_sign_in_path_for(resource)
    root_path
  end

  def set_page_params
    params[:per_page_list] ||= [10,20,30,40,50]
    params[:per_page] ||= 20
  end

  def current_user
    @current_user ||= if use_devise_authentication?
                        super
                      elsif uweb_authenticated?
                        find_or_create_user
                      end
  end

  def find_or_create_user
    user =  if session[:current_user_id].present?
              User.find_by(id: session[:current_user_id])
            else
              login_manager = LoginManager.new(login_data: session[:uweb_user_data])
              if login_manager.find_or_create_user
                login_manager.user
              else
                flash[:error] = login_manager.errors.to_sentence
                nil
              end
            end
    session[:current_user_id] = user.try :id
    user
  end

  def fields_for_options(collection)
    collection.build if collection.empty?
  end

  def project_attributes
    [
      :id,
      :name,
      :description,
      :volunteers_allowed,
      :publish,
      :outstanding,
      :urgent,
      :project_type_id,
      :active,
      :comments,
      :participants_num,
      :beneficiaries_num,
      :volunteers_num,
      :functions,
      :insured,
      :insurance_date,
      :contact_name,
      :contact_last_name,
      :contact_last_name_alt,
      :email,
      :phone_number,
      :phone_number_alt,
      :entity_id,
      :execution_start_date,
      :execution_end_date,
      { area_ids:         [] },
      { collective_ids:   [] },
      { coordination_ids: [] },
      {
        documents_attributes: [
          :id,
          :name,
          :_destroy
        ]
      },
      {
        logo_attributes: [
          :id,
          :link_type_id,
          :file,
          :_destroy
        ]
      },
      # TODO remove images_attributes, videos_attributes and docs_attributes?
      {
        images_attributes: [
          :id,
          :link_type_id,
          :file,
          :_destroy
        ]
      },
      {
        videos_attributes: [
          :id,
          :link_type_id,
          :file,
          :_destroy
        ]
      },
      {
        docs_attributes: [
          :id,
          :link_type_id,
          :file,
          :_destroy
        ]
      },
      {
        urls_attributes: [
          :id,
          :path,
          :link_type_id,
          :file,
          :_destroy
        ]
      },
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
    ]
  end

  def request_form_attributes
    [
      :id,
      :request_type_id,
      :user_id,
      :sent_at,
      :status,
      :status_date,
      :req_rejection_type_id,
      :comments
    ]
  end

end
