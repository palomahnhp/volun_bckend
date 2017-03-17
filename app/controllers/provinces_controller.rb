class ProvincesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= Province.ransack_default
    @search_q = @provinces.search(params[:q])
    @provinces = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@provinces)
  end

  def show
    respond_with(@province) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@province)
  end

  def edit
  end

  def create
    @province.save
    respond_with(@province)
  end

  def update
    @province.update_attributes(province_params)
    respond_with(@province)
  end

  def destroy
    @province.destroy
    respond_with(@province)
  end

  protected

    def province_params
      params.require(:province).permit(:name, :code, :active)
    end
end
