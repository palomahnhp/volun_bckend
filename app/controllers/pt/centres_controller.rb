class Pt::CentresController < ApplicationController

  load_and_authorize_resource instance_name: :pt_centre
  respond_to :html, :js

  def index
    params[:q] ||= PtCentre.ransack_default
    @search_q = @pt_centres.search(params[:q])
    @pt_centres = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_centres)
  end

  def show
    respond_with(@pt_centre) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @pt_centre = Pt::Centre.new
    respond_with(@pt_centre)
  end

  def edit
  end

  def create
    if @pt_centre.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    if @pt_centre.update(pt_centre_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @pt_centre.destroy
    respond_with(@pt_centre)
  end

  protected

    def pt_centre_params
      params
        .require(:pt_centre)
        .permit(
          :notes,
          project_attributes: project_attributes
        )
    end

    alias_method :create_params, :pt_centre_params
end
