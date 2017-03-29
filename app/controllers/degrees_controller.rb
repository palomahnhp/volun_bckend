class DegreesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Degree.ransack_default
    @search_q = @degrees.search(params[:q])
    if params[:degree_type] == t('all') || params[:degree_type].nil? || params[:degree_type] == ""
      @degrees = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)
    else
      @degrees = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15).filter_by_degree_type_name(params[:degree_type])
    end

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
      params.require(:degree).permit(:degree_type_id, :name, :active)
    end
end
