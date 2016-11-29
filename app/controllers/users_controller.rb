class UsersController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= User.ransack_default
    @search_q = @users.search(params[:q])
    @users = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@users)
  end

  def show
    respond_with(@user) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  def create
    @user.save
    respond_with(@user)
  end

  def update
    @user.update_attributes(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  protected

    def user_params
      params.require(:user).permit(:locale, :profileable_id)
    end
end
