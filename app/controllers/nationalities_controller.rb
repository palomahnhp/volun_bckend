class NationalitiesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Nationality.ransack_default
    @search_q = @nationalities.search(params[:q])
    @nationalities = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@nationalities)
  end

  def show
    respond_with(@nationality) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @nationality = Nationality.new
    respond_with(@nationality)
  end

  def edit
  end

  def create
    @nationality.save
    respond_with(@nationality)
  end

  def update
    @nationality.update_attributes(nationality_params)
    respond_with(@nationality)
  end

  def destroy
    @nationality.destroy
    respond_with(@nationality)
  end

  def recover
    @nationality.recover
    respond_with(@nationality)
  end

  protected

    def nationality_params
      params.require(:nationality).permit(:name, :active)
    end
end
