class EntityTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= EntityType.ransack_default
    @search_q = @entity_types.search(params[:q])
    @entity_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@entity_types)
  end

  def show
    respond_with(@entity_type) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @entity_type = EntityType.new
    respond_with(@entity_type)
  end

  def edit
  end

  def create
    @entity_type.save
    respond_with(@entity_type)
  end

  def update
    @entity_type.update_attributes(entity_type_params)
    respond_with(@entity_type)
  end

  def destroy
    @entity_type.destroy
    respond_with(@entity_type)
  end

  protected

    def entity_type_params
      params.require(:entity_type).permit(:kind, :description, :active)
    end
end
