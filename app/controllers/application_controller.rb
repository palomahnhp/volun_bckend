class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_page_params, only: [:index]

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    begin
      redirect_to :back
    rescue
      redirect_to root_path
    end
  end

  private

  def set_page_params
    params[:per_page_list] ||= [10,20,30,40,50]
    params[:per_page] ||= 20
  end

  # Devise: Where to redirect users once they have logged in
  def after_sign_in_path_for(resource)
    root_path
  end
end
