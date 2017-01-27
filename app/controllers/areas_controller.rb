class AreasController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Area.ransack_default
    @search_q = @areas.search(params[:q])
    @areas = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@areas)
  end

  def show
    respond_with(@area) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @area = Area.new
    respond_with(@area)
  end

  def edit
  end

  def create
    @area.save
    respond_with(@area)
  end

  def update
    @area.update_attributes(area_params)
    respond_with(@area)
  end

  def destroy
    @area.destroy
    respond_with(@area)
  end

  def recover
    @area.recover
    respond_with(@area)
  end

  protected

    def area_params
      params.require(:area).permit(:name, :description, :active)
    end
end
