class CollectivesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Collective.ransack_default
    @search_q = @collectives.search(params[:q])
    @collectives = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@collectives)
  end

  def show
    respond_with(@collective) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @collective = Collective.new
    respond_with(@collective)
  end

  def edit
  end

  def create
    @collective.save
    respond_with(@collective)
  end

  def update
    @collective.update_attributes(collective_params)
    respond_with(@collective)
  end

  def destroy
    @collective.destroy
    respond_with(@collective)
  end

  def recover
    @collective.recover
    respond_with(@collective)
  end

  protected

    def collective_params
      params.require(:collective).permit(:name, :description, :active)
    end
end
