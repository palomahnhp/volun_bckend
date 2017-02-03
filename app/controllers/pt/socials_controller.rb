class Pt::SocialsController < ApplicationController

  load_and_authorize_resource instance_name: :pt_social
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
    respond_with(@pt_social)
  end

  def edit
  end

  def create
    @pt_social.save
    respond_with(@pt_social, location: projects_path)
  end

  def update
    if @pt_social.update(pt_social_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @pt_social.destroy
    respond_with(@pt_social)
  end

  protected

    def pt_social_params
      params
        .require(:pt_social)
        .permit(
          :notes,
          project_attributes: project_attributes
        )
    end

  alias_method :create_params, :pt_social_params
end
