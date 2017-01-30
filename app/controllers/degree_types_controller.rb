class DegreeTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= DegreeType.ransack_default
    @search_q = @degree_types.search(params[:q])
    @degree_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@degree_types)
  end

  def show
    respond_with(@degree_type) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @degree_type = DegreeType.new
    respond_with(@degree_type)
  end

  def edit
  end

  def create
    @degree_type.save
    respond_with(@degree_type)
  end

  def update
    @degree_type.update_attributes(degree_type_params)
    respond_with(@degree_type)
  end

  def destroy
    @degree_type.destroy
    respond_with(@degree_type)
  end

  protected

    def degree_type_params
      params.require(:degree_type).permit(:name, :educational_type)
    end
end
