class RftOthersController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftOther.ransack_default
    @search_q = @rft_others.search(params[:q])
    @rft_others = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_others)
  end

  def show
    respond_with(@rft_other) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_other = RftOther.new
    respond_with(@rft_other)
  end

  def edit
  end

  def create
    @rft_other.save
    respond_with(@rft_other)
  end

  def update
    @rft_other.update_attributes(rft_other_params)
    respond_with(@rft_other)
  end

  def destroy
    @rft_other.destroy
    respond_with(@rft_other)
  end

  protected

    def rft_other_params
      params.require(:rft_other).permit(:request_form_type_id, :entity_id, :description)
    end
end
