class Pt::CentresController < ApplicationController

  load_and_authorize_resource
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
    @pt_centre.save
    respond_with(@pt_centre)
  end

  def update
    @pt_centre.update_attributes(pt_centre_params)
    respond_with(@pt_centre)
  end

  def destroy
    @pt_centre.destroy
    respond_with(@pt_centre)
  end

  protected

    def pt_centre_params
      params.require(:pt_centre).permit(:notes)
    end
end
