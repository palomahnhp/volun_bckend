class RtOthersController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtOther.ransack_default
    @search_q = @rt_others.search(params[:q])
    @rt_others = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_others)
  end

  def show
    respond_with(@rt_other) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rt_other = RtOther.new
    respond_with(@rt_other)
  end

  def edit
  end

  def create
    @rt_other.save
    respond_with(@rt_other)
  end

  def update
    @rt_other.update_attributes(rt_other_params)
    respond_with(@rt_other)
  end

  def destroy
    @rt_other.destroy
    respond_with(@rt_other)
  end

  protected

    def rt_other_params
      params.require(:rt_other).permit(:description)
    end
end
