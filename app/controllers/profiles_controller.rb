class ProfilesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Profile.ransack_default
    @search_q = @profiles.search(params[:q])
    @profiles = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@profiles)
  end

  def show
    respond_with(@profile) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update_attributes(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  protected

    def profile_params
      params.require(:profile).permit(:name, :active)
    end
end
