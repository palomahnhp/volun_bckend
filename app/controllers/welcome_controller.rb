class WelcomeController < ApplicationController

  def index
    if session[:user_authenticated] || params.fetch(:authenticated, false)
      render 'index'
    elsif uweb_authenticated?
      redirect_to root_path
    else
      redirect_to root_path(authenticated: false), notice: 'Usuario no autorizado'
    end
  end

  private

    def uweb_authenticated?
      session[:user_authenticated] = UwebAuthenticator.new(params).authenticate!
    end

end
