class ContactTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ContactType.ransack_default
    @search_q = @contact_types.search(params[:q])
    @contact_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@contact_types)
  end

  def show
    respond_with(@contact_type) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @contact_type = ContactType.new
    respond_with(@contact_type)
  end

  def edit
  end

  def create
    @contact_type.save
    respond_with(@contact_type)
  end

  def update
    @contact_type.update_attributes(contact_type_params)
    respond_with(@contact_type)
  end

  def destroy
    @contact_type.destroy
    respond_with(@contact_type)
  end

  protected

    def contact_type_params
      params.require(:contact_type).permit(:name, :active)
    end
end
