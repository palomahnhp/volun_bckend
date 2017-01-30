class Pt::SocialsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js

  def index
    params[:q] ||= PtSocial.ransack_default
    @search_q = @pt_socials.search(params[:q])
    @pt_socials = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pt_socials)
  end

  def show
    respond_with(@pt_social) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @pt_social = Pt::Social.new
    respond_with(@pt_social)
  end

  def edit
  end

  def create
    @pt_social.save
    respond_with(@pt_social)
  end

  def update
    @pt_social.update_attributes(pt_social_params)
    respond_with(@pt_social)
  end

  def destroy
    @pt_social.destroy
    respond_with(@pt_social)
  end

  protected

    def pt_social_params
      params.require(:pt_social).permit(:notes)
    end
end
