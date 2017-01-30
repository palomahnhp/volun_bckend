class RecordHistoriesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RecordHistory.ransack_default
    @search_q = @record_histories.search(params[:q])
    @record_histories = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@record_histories)
  end

  def show
    respond_with(@record_history) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @record_history = RecordHistory.new
    respond_with(@record_history)
  end

  def edit
  end

  def create
    @record_history.save
    respond_with(@record_history)
  end

  def update
    @record_history.update_attributes(record_history_params)
    respond_with(@record_history)
  end

  def destroy
    @record_history.destroy
    respond_with(@record_history)
  end

  protected

    def record_history_params
      params.require(:record_history).permit(:user_id, :recordable_id, :recordable_type, :recordable_changed_at)
    end
end
