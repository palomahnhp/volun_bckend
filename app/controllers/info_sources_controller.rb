class InfoSourcesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= InfoSource.ransack_default
    @search_q = @info_sources.search(params[:q])
    @info_sources = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@info_sources)
  end

  def show
    respond_with(@info_source) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @info_source = InfoSource.new
    respond_with(@info_source)
  end

  def edit
  end

  def create
    @info_source.save
    respond_with(@info_source)
  end

  def update
    @info_source.update_attributes(info_source_params)
    respond_with(@info_source)
  end

  def destroy
    @info_source.destroy
    respond_with(@info_source)
  end

  protected

    def info_source_params
      params.require(:info_source).permit(:name, :active)
    end
end
