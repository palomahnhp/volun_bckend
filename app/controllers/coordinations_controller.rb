class CoordinationsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Coordination.ransack_default
    @search_q = @coordinations.search(params[:q])
    @coordinations = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@coordinations)
  end

  def show
    respond_with(@coordination) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @coordination = Coordination.new
    respond_with(@coordination)
  end

  def edit
  end

  def create
    @coordination.save
    respond_with(@coordination)
  end

  def update
    @coordination.update_attributes(coordination_params)
    respond_with(@coordination)
  end

  def destroy
    @coordination.destroy
    respond_with(@coordination)
  end

  def recover
    @coordination.recover
    respond_with(@coordination)
  end

  protected

    def coordination_params
      params.require(:coordination).permit(:name, :description, :active)
    end
end
