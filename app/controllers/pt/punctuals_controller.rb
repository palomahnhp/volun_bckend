class Pt::PunctualsController < ApplicationController

  load_and_authorize_resource instance_name: :pt_punctual
  respond_to :html, :js

  def index
    params[:q] ||= PtPunctual.ransack_default
    @search_q = @pt_punctuals.search(params[:q])
    @pt_punctuals = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_punctuals)
  end

  def show
    respond_with(@pt_punctual) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@pt_punctual)
  end

  def edit
  end

  def create
    @pt_punctual.save
    respond_with(@pt_punctual, location: projects_path)
  end

  def update
    if @pt_punctual.update(pt_punctual_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @pt_punctual.destroy
    respond_with(@pt_punctual)
  end

  protected

    def pt_punctual_params
      params
        .require(:pt_punctual)
        .permit(
          :notes,
          project_attributes: project_attributes
        )
    end

    alias_method :create_params, :pt_punctual_params
end
