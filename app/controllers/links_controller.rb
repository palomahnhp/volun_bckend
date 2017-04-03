class LinksController < ApplicationController

  load_and_authorize_resource
  before_action :get_search_params, only: [:index]

  respond_to :html, :js, :json

  def index
    params[:q]      = get_search_params
    @search_q       = @links.search(params[:q])
    @search_filters = params[:q].slice(:linkable_id_eq, :linkable_type_eq, :link_type_id_eq)
    @links          = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@links)
  end

  def show
    respond_with(@link) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @link = Link.new(params[:link] ? link_params : {})
    respond_with(@link)
  end

  def edit
  end

  def create
    @link.save
    respond_with(@link, location: links_path(@link.attributes.slice('linkable_id', 'linkable_type', 'link_type_id')))
  end

  def update
    @link.update_attributes(link_params)
    respond_with(@link, location: links_path(@link.attributes.slice('linkable_id', 'linkable_type', 'link_type_id')))
  end

  def destroy
    @link.destroy
    respond_with(@link)
  end

  protected

    def link_params
      params.require(:link).permit(:path, :description, :file,  :linkable_id, :linkable_type, :link_type_id)
    end

    def get_search_params
      params[:q] ||= Link.ransack_default
      params[:q][:linkable_id_eq]   = params[:q][:linkable_id_eq].presence   || params[:linkable_id]
      params[:q][:linkable_type_eq] = params[:q][:linkable_type_eq].presence || params[:linkable_type]
      params[:q][:link_type_id_eq]  = params[:q][:link_type_id_eq].presence  || params[:link_type_id]
      params[:q]
    end
end
