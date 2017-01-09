class LanguageLevelsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= LanguageLevel.ransack_default
    @search_q = @language_levels.search(params[:q])
    @language_levels = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@language_levels)
  end

  def show
    respond_with(@language_level) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @language_level = LanguageLevel.new
    respond_with(@language_level)
  end

  def edit
  end

  def create
    @language_level.save
    respond_with(@language_level)
  end

  def update
    @language_level.update_attributes(language_level_params)
    respond_with(@language_level)
  end

  def destroy
    @language_level.destroy
    respond_with(@language_level)
  end

  protected

    def language_level_params
      params.require(:language_level).permit(:name, :active)
    end
end
