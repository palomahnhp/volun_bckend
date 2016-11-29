class PtOthersController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= PtOther.ransack_default
    @search_q = @pt_others.search(params[:q])
    @pt_others = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_others)
  end

  def show
    respond_with(@pt_other) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @pt_other = PtOther.new
    respond_with(@pt_other)
  end

  def edit
  end

  def create
    @pt_other.save
    respond_with(@pt_other, location: projects_path)
  end

  def update
    @pt_other.update_attributes(pt_other_params)
    respond_with(@pt_other, location: projects_path)
  end

  def destroy
    @pt_other.destroy
    respond_with(@pt_other, location: projects_path)
  end

  protected

    def pt_other_params
      params.require(:pt_other).permit(permitted_project_attrs)
    end
end
