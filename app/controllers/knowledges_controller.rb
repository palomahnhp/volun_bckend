class KnowledgesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Knowledge.ransack_default
    @search_q = @knowledges.search(params[:q])
    @knowledges = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@knowledges)
  end

  def show
    respond_with(@knowledge) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @knowledge = Knowledge.new
    respond_with(@knowledge)
  end

  def edit
  end

  def create
    @knowledge.save
    respond_with(@knowledge)
  end

  def update
    @knowledge.update_attributes(knowledge_params)
    respond_with(@knowledge)
  end

  def destroy
    @knowledge.destroy
    respond_with(@knowledge)
  end

  protected

    def knowledge_params
      params.require(:knowledge).permit(:name, :active)
    end
end
