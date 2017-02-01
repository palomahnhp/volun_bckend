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
    if @pt_other.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    if @pt_other.update(pt_permanent_params)
      redirect_to projects_path
    else
      render :edit
    end
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
