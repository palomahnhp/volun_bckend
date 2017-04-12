class WelcomeController < ApplicationController

  def index
  end

  def administration
    authorize! :administration, WelcomeController
  end

  def maintenance
    authorize! :maintenance, WelcomeController
  end

end
