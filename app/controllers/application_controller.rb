require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate!, unless: :user_authenticated?
  before_action :set_page_params, only: [:index]
  after_action :update_record_history, only: [:create, :update, :destroy], unless: :devise_controller?

  helper_method :use_devise_authentication?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = I18n.t('messages.access_denied')
    begin
      redirect_to :back
    rescue
      redirect_to root_path
    end
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
    session.fetch(:user_authenticated, false)
  end

  # TODO Create Setting model for app configuration
  def use_devise_authentication?
    # Object.const_defined?('Devise') && Setting.use_devise?
    true
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
      :project_type_id,
      :volunteers_allowed,
      :public,
      :active,
      :outstanding,
      :description,
      :comments,
      :volunteers_num,
      :beneficiaries_num,
      :functions,
      :contact_name,
      :contact_first_surname,
      :contact_second_surname,
      :email,
      :phone_number,
      :entity_id,
      :execution_start_date,
      :execution_end_date,
      :insured,
      :insurance_date,
      area_ids:         [],
      collective_ids:   [],
      coordination_ids: [],
      district_ids:     [],
    # TODO Pending of adapting addresses and timetables form to the new model design
      # documents_attributes: [
      #   :id,
      #   :name,
      #   :_destroy
      # ]
    ]
  end

  def request_form_attributes
    [
      :request_type_id,
      :user_id,
      :sent_at,
      :status,
      :status_date,
      :rejection_type_id,
      :comments
    ]
  end

end
