class PtEntitiesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= PtEntity.ransack_default
    @search_q = @pt_entities.search(params[:q])
    @pt_entities = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_entities)
  end

  def show
    respond_with(@pt_entity) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @pt_entity = PtEntity.new
    respond_with(@pt_entity)
  end

  def edit
  end

  def create
    @pt_entity.save
    respond_with(@pt_entity)
  end

  def update
    @pt_entity.update_attributes(pt_entity_params)
    respond_with(@pt_entity)
  end

  def destroy
    @pt_entity.destroy
    respond_with(@pt_entity)
  end

  protected

    def pt_entity_params
      params
        .require(:pt_entity)
        .permit(
          :request_date,
          :request_description,
          :volunteers_profile,
          :activities,
          :sav_date,
          :derived_volunteers_num,
          :added_volunteers_num,
          :agreement_signed,
          :agreement_date,
          :prevailing,
          :project_id,
          :project_type_id
        )
    end
end
