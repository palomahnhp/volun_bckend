class BoroughsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Borough.ransack_default
    @search_q = @boroughs.search(params[:q])
    @boroughs = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@boroughs)
  end

  def show
    respond_with(@borough) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @borough = Borough.new
    respond_with(@borough)
  end

  def edit
  end

  def create
    @borough.save
    respond_with(@borough)
  end

  def update
    @borough.update_attributes(borough_params)
    respond_with(@borough)
  end

  def destroy
    @borough.destroy
    respond_with(@borough)
  end

  protected

    def borough_params
      params.require(:borough).permit(:name, :active, :district_id)
    end
end
