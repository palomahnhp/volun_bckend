class LanguagesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Language.ransack_default
    @search_q = @languages.search(params[:q])
    @languages = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@languages)
  end

  def show
    respond_with(@language) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @language = Language.new
    respond_with(@language)
  end

  def edit
  end

  def create
    @language.save
    respond_with(@language)
  end

  def update
    @language.update_attributes(language_params)
    respond_with(@language)
  end

  def destroy
    @language.destroy
    respond_with(@language)
  end

  protected

    def language_params
      params.require(:language).permit(:name, :active)
    end
end
