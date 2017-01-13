class Pt::EntitiesController < ApplicationController

  load_and_authorize_resource instance_name: :pt_entity
  respond_to :html, :js, :json

  def index
    params[:q] ||= Pt::Entity.ransack_default
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
    respond_with(@pt_entity)
  end

  def edit
  end

  def create
    if @pt_entity.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    if @pt_entity.update(pt_entity_params)
      redirect_to projects_path
    else
      render :edit
    end
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
          project_attributes: project_attributes
        )
    end

    alias_method :create_params, :pt_entity_params

end
