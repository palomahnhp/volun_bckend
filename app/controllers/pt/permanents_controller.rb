class Pt::PermanentsController < ApplicationController

  load_and_authorize_resource instance_name: :pt_permanent
  respond_to :html, :js

  def index
    params[:q] ||= Pt::Permanent.ransack_default
    @search_q = @pt_permanents.search(params[:q])
    @pt_permanents = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_permanents)
  end

  def show
    respond_with(@pt_permanent) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@pt_permanent)
  end

  def edit
  end

  def create
    @pt_permanent.save
    respond_with(@pt_permanent, location: projects_path)
  end

  def update
    @pt_permanent.update(pt_permanent_params)
    respond_with(@pt_permanent, location: projects_path)
  end

  def destroy
    @pt_permanent.destroy
    respond_with(@pt_permanent)
  end

  protected

    def pt_permanent_params
      params
        .require(:pt_permanent)
        .permit(
          :notes,
          project_attributes: project_attributes
        )
    end

    alias_method :create_params, :pt_permanent_params
end
