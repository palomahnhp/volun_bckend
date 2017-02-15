class Req::RejectionTypesController < ApplicationController

  load_and_authorize_resource instance_name: :req_rejection_type
  respond_to :html, :js

  def index
    params[:q] ||= Req::RejectionType.ransack_default
    @search_q = @req_rejection_types.search(params[:q])
    @req_rejection_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@req_rejection_types)
  end

  def show
    respond_with(@req_rejection_type) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@req_rejection_type)
  end

  def edit
  end

  def create
    @req_rejection_type.save
    respond_with(@req_rejection_type)
  end

  def update
    @req_rejection_type.update_attributes(req_rejection_type_params)
    respond_with(@req_rejection_type)
  end

  def destroy
    @req_rejection_type.destroy
    respond_with(@req_rejection_type)
  end
  
  def recover
    @req_rejection_type.recover
    respond_with(@req_rejection_type)
  end

  protected

    def req_rejection_type_params
      params.require(:req_rejection_type).permit(:name, :description, :active)
    end

    alias_method :create_params, :req_rejection_type_params
end
