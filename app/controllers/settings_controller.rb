class SettingsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= Setting.ransack_default
    @search_q = @settings.search(params[:q])
    @settings = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@settings)
  end

  def show
    respond_with(@setting) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@setting)
  end

  def edit
  end

  def create
    @setting.save
    respond_with(@setting)
  end

  def update
    @setting.update_attributes(setting_params)
    respond_with(@setting)
  end

  def destroy
    @setting.destroy
    respond_with(@setting)
  end

  protected

    def setting_params
      params.require(:setting).permit(:key, :value)
    end
end
