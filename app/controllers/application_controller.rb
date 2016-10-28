class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate!, unless: :user_authenticated?
  before_action :set_page_params, only: [:index]
  after_action :associate_current_user, only: [:create, :update, :destroy], unless: :devise_controller?

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

  def associate_current_user
    return unless recordable?
    record = instance_variable_get("@#{model.model_name.singular}")
    record.update_history(current_user.try(:id))
  end

  def recordable?
    model.included_modules.map(&:to_s).include?('Recordable')
  end

  def model
    @model ||= controller_name.classify.constantize
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

  # TODO user persistent users when uweb authentication
  def current_user
    return super if use_devise_authentication?
    User.new if uweb_authenticated?
  end

end
