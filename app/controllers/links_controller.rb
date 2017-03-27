class LinksController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Link.ransack_default
    @search_q = @links.search(params[:q])
    @links = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@links)
  end

  def show
    respond_with(@link) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @link = Link.new
    respond_with(@link)
  end

  def edit
  end

  def create
    @link.save
    respond_with(@link)
  end

  def update
    @link.update_attributes(link_params)
    respond_with(@link)
  end

  def destroy
    @link.destroy
    respond_with(@link)
  end

  def target
    puts "+++++++++++++++++++++++++++ target 1"
    @incoming_file = params[:file]
    file_name = params[:original_file_name]
    # FileUtils.mv @incoming_file.tempfile, "/Users/my_home_directory/#{file_name}"
    FileUtils.mv @incoming_file.tempfile, "#{Rails.root.to_s}/#{file_name}"
    puts "+++++++++++++++++++++++++++ target 2"
  end

  protected

    def link_params
      params.require(:link).permit(:path, :description, :linkable_id)
    end
end
