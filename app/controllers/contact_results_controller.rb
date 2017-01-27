class ContactResultsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ContactResult.ransack_default
    @search_q = @contact_results.search(params[:q])
    @contact_results = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@contact_results)
  end

  def show
    respond_with(@contact_result) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @contact_result = ContactResult.new
    respond_with(@contact_result)
  end

  def edit
  end

  def create
    @contact_result.save
    respond_with(@contact_result)
  end

  def update
    @contact_result.update_attributes(contact_result_params)
    respond_with(@contact_result)
  end

  def destroy
    @contact_result.destroy
    respond_with(@contact_result)
  end

  protected

    def contact_result_params
      params.require(:contact_result).permit(:name, :active)
    end
end
