class Rt::OthersController < ApplicationController

  load_and_authorize_resource instance_name: :rt_other
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::Other.ransack_default
    @search_q = @rt_others.search(params[:q])
    @rt_others = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_others)
  end

  def show
    respond_with(@rt_other) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_other)
  end

  def edit
  end

  def create
    @rt_other.save
    respond_with(@rt_other, location: projects_path)
  end

  def update
    @rt_other.update(rt_other_params)
    respond_with(@rt_other, location: projects_path)
  end

  def destroy
    @rt_other.destroy
    respond_with(@rt_other)
  end

  protected

    def rt_other_params
      params
        .require(:rt_other)
        .permit(:description, request_form_attributes: request_form_attributes)
    end

    alias_method :create_params, :rt_other_params

end
