class FrontpageElementsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= FrontpageElement.ransack_default
    @search_q = @frontpage_elements.search(params[:q])
    @frontpage_elements = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@frontpage_elements)
  end

  def show
    respond_with(@frontpage_element) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@frontpage_element)
  end

  def edit
  end

  def create
    @frontpage_element.save
    respond_with(@frontpage_element)
  end

  def update
    @frontpage_element.update_attributes(frontpage_element_params)
    respond_with(@frontpage_element)
  end

  def destroy
    @frontpage_element.destroy
    respond_with(@frontpage_element)
  end
  
  def recover
    @frontpage_element.recover
    respond_with(@frontpage_element)
  end

  protected

    def frontpage_element_params
      params.require(:frontpage_element).permit(:frontpage_position_id, :created_by, :text_panel, :text_button, :image_url, :link_url, :logo_url, :active)
    end
end
