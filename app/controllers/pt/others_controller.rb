class Pt::OthersController < ApplicationController

  load_and_authorize_resource instance_name: :pt_other
  respond_to :html, :js

  def index
    params[:q] ||= Pt::Other.ransack_default
    @search_q = @pt_others.search(params[:q])
    @pt_others = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_others)
  end

  def show
    respond_with(@pt_other) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@pt_other)
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
    if @pt_other.update(pt_other_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @pt_other.destroy
    respond_with(@pt_other)
  end

  protected

    def pt_other_params
      params
        .require(:pt_other)
        .permit(
          :notes,
          project_attributes: project_attributes
        )
    end

    alias_method :create_params, :pt_other_params
end
