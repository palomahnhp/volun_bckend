class FrontpagePositionsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= FrontpagePosition.ransack_default
    @search_q = @frontpage_positions.search(params[:q])
    @frontpage_positions = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@frontpage_positions)
  end

  def show
    respond_with(@frontpage_position) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@frontpage_position)
  end

  def edit
  end

  def create
    @frontpage_position.save
    respond_with(@frontpage_position)
  end

  def update
    @frontpage_position.update_attributes(frontpage_position_params)
    respond_with(@frontpage_position)
  end

  def destroy
    @frontpage_position.destroy
    respond_with(@frontpage_position)
  end
  
  def recover
    @frontpage_position.recover
    respond_with(@frontpage_position)
  end

  protected

    def frontpage_position_params
      params.require(:frontpage_position).permit(:position, :description, :active)
    end
end
