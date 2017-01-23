class IdNumberTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= IdNumberType.ransack_default
    @search_q = @id_number_types.search(params[:q])
    @id_number_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@id_number_types)
  end

  def show
    respond_with(@id_number_type) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @id_number_type = IdNumberType.new
    respond_with(@id_number_type)
  end

  def edit
  end

  def create
    @id_number_type.save
    respond_with(@id_number_type)
  end

  def update
    @id_number_type.update_attributes(id_number_type_params)
    respond_with(@id_number_type)
  end

  def destroy
    @id_number_type.destroy
    respond_with(@id_number_type)
  end

  protected

    def id_number_type_params
      params.require(:id_number_type).permit(:name, :active)
    end
end
