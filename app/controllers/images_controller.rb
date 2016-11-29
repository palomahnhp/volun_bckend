class ImagesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Image.ransack_default
    @search_q = @images.search(params[:q])
    @images = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@images)
  end

  def show
    respond_with(@image) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @image = Image.new
    respond_with(@image)
  end

  def edit
  end

  def create
    @image.save
    respond_with(@image)
  end

  def update
    @image.update_attributes(image_params)
    respond_with(@image)
  end

  def destroy
    @image.destroy
    respond_with(@image)
  end

  protected

    def image_params
      params.require(:image).permit(:name, :payload, :project_id)
    end
end
