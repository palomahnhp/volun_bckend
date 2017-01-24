class RejectionTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RejectionType.ransack_default
    @search_q = @rejection_types.search(params[:q])
    @rejection_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rejection_types)
  end

  def show
    respond_with(@rejection_type) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rejection_type = RejectionType.new
    respond_with(@rejection_type)
  end

  def edit
  end

  def create
    @rejection_type.save
    respond_with(@rejection_type)
  end

  def update
    @rejection_type.update_attributes(rejection_type_params)
    respond_with(@rejection_type)
  end

  def destroy
    @rejection_type.destroy
    respond_with(@rejection_type)
  end

  def recover
    @rejection_type.recover
    respond_with(@rejection_type)
  end

  protected

    def rejection_type_params
      params.require(:rejection_type).permit(:kind, :description, :active)
    end
end
