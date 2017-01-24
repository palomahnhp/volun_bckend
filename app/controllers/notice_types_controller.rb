class NoticeTypesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= NoticeType.ransack_default
    @search_q = @notice_types.search(params[:q])
    @notice_types = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@notice_types)
  end

  def show
    respond_with(@notice_type) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @notice_type = NoticeType.new
    respond_with(@notice_type)
  end

  def edit
  end

  def create
    @notice_type.save
    respond_with(@notice_type)
  end

  def update
    @notice_type.update_attributes(notice_type_params)
    respond_with(@notice_type)
  end

  def destroy
    @notice_type.destroy
    respond_with(@notice_type)
  end

  protected

    def notice_type_params
      params.require(:notice_type).permit(:kind, :description)
    end
end
