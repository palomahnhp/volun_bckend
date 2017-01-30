class DegreesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Degree.ransack_default
    @search_q = @degrees.search(params[:q])
    @degrees = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@degrees)
  end

  def show
    respond_with(@degree) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @degree = Degree.new
    respond_with(@degree)
  end

  def edit
  end

  def create
    @degree.save
    respond_with(@degree)
  end

  def update
    @degree.update_attributes(degree_params)
    respond_with(@degree)
  end

  def destroy
    @degree.destroy
    respond_with(@degree)
  end

  def recover
    @degree.recover
    respond_with(@degree)
  end

  protected

    def degree_params
      params.require(:degree).permit(:name, :active)
    end
end
