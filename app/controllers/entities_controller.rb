class EntitiesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Entity.ransack_default
    @search_q = @entities.search(params[:q])
    @entities = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@entities)
  end

  def show
    respond_with(@entity) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @entity = Entity.new
    respond_with(@entity)
  end

  def edit
  end

  def create
    @entity.save
    respond_with(@entity)
  end

  def update
    @entity.update_attributes(entity_params)
    respond_with(@entity)
  end

  def destroy
    @entity.destroy
    respond_with(@entity)
  end

  protected

    def entity_params
      params.require(:entity).permit(:name, :description, :active, :entity_type_id)
    end
end
