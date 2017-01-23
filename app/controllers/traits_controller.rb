class TraitsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Trait.ransack_default
    @search_q = @traits.search(params[:q])
    @traits = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@traits)
  end

  def show
    respond_with(@trait) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @trait = Trait.new
    respond_with(@trait)
  end

  def edit
  end

  def create
    @trait.save
    respond_with(@trait)
  end

  def update
    @trait.update_attributes(trait_params)
    respond_with(@trait)
  end

  def destroy
    @trait.destroy
    respond_with(@trait)
  end

  protected

    def trait_params
      params.require(:trait).permit(:name, :active)
    end
end
