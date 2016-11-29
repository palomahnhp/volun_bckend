class VolunteersController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Volunteer.ransack_default
    @search_q = @volunteers.search(params[:q])
    @volunteers = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@volunteers)
  end

  def show
    respond_with(@volunteer) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @volunteer = Volunteer.new
    respond_with(@volunteer)
  end

  def edit
  end

  def create
    @volunteer.save
    respond_with(@volunteer)
  end

  def update
    @volunteer.update_attributes(volunteer_params)
    respond_with(@volunteer)
  end

  def destroy
    @volunteer.destroy
    respond_with(@volunteer)
  end

  protected

    def volunteer_params
      params.require(:volunteer).permit(:name, :first_surname, :second_surname, :age, :id_number)
    end
end
