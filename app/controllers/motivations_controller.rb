class MotivationsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Motivation.ransack_default
    @search_q = @motivations.search(params[:q])
    @motivations = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@motivations)
  end

  def show
    respond_with(@motivation) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @motivation = Motivation.new
    respond_with(@motivation)
  end

  def edit
  end

  def create
    @motivation.save
    respond_with(@motivation)
  end

  def update
    @motivation.update_attributes(motivation_params)
    respond_with(@motivation)
  end

  def destroy
    @motivation.destroy
    respond_with(@motivation)
  end

  protected

    def motivation_params
      params.require(:motivation).permit(:name, :active)
    end
end
