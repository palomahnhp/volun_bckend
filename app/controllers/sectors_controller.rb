class SectorsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Sector.ransack_default
    @search_q = @sectors.search(params[:q])
    @sectors = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@sectors)
  end

  def show
    respond_with(@sector) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @sector = Sector.new
    respond_with(@sector)
  end

  def edit
  end

  def create
    @sector.save
    respond_with(@sector)
  end

  def update
    @sector.update_attributes(sector_params)
    respond_with(@sector)
  end

  def destroy
    @sector.destroy
    respond_with(@sector)
  end

  def recover
    @sector.recover
    respond_with(@sector)
  end

  protected

    def sector_params
      params.require(:sector).permit(:name, :active)
    end
end
