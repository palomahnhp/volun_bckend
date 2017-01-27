class DistrictsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= District.ransack_default
    @search_q = @districts.search(params[:q])
    @districts = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@districts)
  end

  def show
    respond_with(@district) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @district = District.new
    respond_with(@district)
  end

  def edit
  end

  def create
    @district.save
    respond_with(@district)
  end

  def update
    @district.update_attributes(district_params)
    respond_with(@district)
  end

  def destroy
    @district.destroy
    respond_with(@district)
  end

  protected

    def district_params
      params.require(:district).permit(:name, :code, :active)
    end
end
