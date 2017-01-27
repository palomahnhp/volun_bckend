class DocumentsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Document.ransack_default
    @search_q = @documents.search(params[:q])
    @documents = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@documents)
  end

  def show
    respond_with(@document) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @document = Document.new
    respond_with(@document)
  end

  def edit
  end

  def create
    @document.save
    respond_with(@document)
  end

  def update
    @document.update_attributes(document_params)
    respond_with(@document)
  end

  def destroy
    @document.destroy
    respond_with(@document)
  end

  protected

    def document_params
      params.require(:document).permit(:name, :description, :documentum_id, :project_id)
    end
end
