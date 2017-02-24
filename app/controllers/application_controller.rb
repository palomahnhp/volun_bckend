require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate!, unless: :user_authenticated?
  before_action :set_page_params, only: [:index]
  after_action :update_record_history, only: [:create, :update, :destroy], unless: :devise_controller?

  helper_method :use_devise_authentication?, :cast_as_boolean

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = I18n.t('messages.access_denied')
    begin
      redirect_to :back
    rescue
      redirect_to root_path
    end
  end

  def cast_as_boolean(boolean_string)
    ActiveRecord::Type::Boolean.new.type_cast_from_user boolean_string
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

  def uweb_authenticated?
    return true if session[:user_authenticated]
    uweb_auth     = UwebAuthenticator.new(params)
    authenticated = uweb_auth.authenticate!
    session[:uweb_user_data] = uweb_auth.uweb_user_data
    authenticated
  end

  def user_authenticated?
    current_user || session.fetch(:user_authenticated, false)
  end

  # TODO Create Setting model for app configuration
  def use_devise_authentication?
    Setting['backend.']
  end

  # Devise: Where to redirect users once they have logged in
  def after_sign_in_path_for(resource)
    session[:user_authenticated] = true
    root_path
  end

  def set_page_params
    params[:per_page_list] ||= [10,20,30,40,50]
    params[:per_page] ||= 20
  end

  # TODO use persistent users when uweb authentication
  def current_user
    return super if use_devise_authentication?
    User.new if uweb_authenticated?
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
              :no_bdc_check,
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
