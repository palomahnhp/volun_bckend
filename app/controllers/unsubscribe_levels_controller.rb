class UnsubscribeLevelsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= UnsubscribeLevel.ransack_default
    @search_q = @unsubscribe_levels.search(params[:q])
    @unsubscribe_levels = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@unsubscribe_levels)
  end

  def show
    respond_with(@unsubscribe_level) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @unsubscribe_level = UnsubscribeLevel.new
    respond_with(@unsubscribe_level)
  end

  def edit
  end

  def create
    @unsubscribe_level.save
    respond_with(@unsubscribe_level)
  end

  def update
    @unsubscribe_level.update_attributes(unsubscribe_level_params)
    respond_with(@unsubscribe_level)
  end

  def destroy
    @unsubscribe_level.destroy
    respond_with(@unsubscribe_level)
  end

  protected

    def unsubscribe_level_params
      params.require(:unsubscribe_level).permit(:kind, :description)
    end
end
