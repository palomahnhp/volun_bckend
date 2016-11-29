class RftVolunteersDemandsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RftVolunteersDemand.ransack_default
    @search_q = @rft_volunteers_demands.search(params[:q])
    @rft_volunteers_demands = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rft_volunteers_demands)
  end

  def show
    respond_with(@rft_volunteers_demand) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rft_volunteers_demand = RftVolunteersDemand.new
    respond_with(@rft_volunteers_demand)
  end

  def edit
  end

  def create
    @rft_volunteers_demand.save
    respond_with(@rft_volunteers_demand)
  end

  def update
    @rft_volunteers_demand.update_attributes(rft_volunteers_demand_params)
    respond_with(@rft_volunteers_demand)
  end

  def destroy
    @rft_volunteers_demand.destroy
    respond_with(@rft_volunteers_demand)
  end

  protected

    def rft_volunteers_demand_params
      params.require(:rft_volunteers_demand).permit(:request_form_type_id, :entity_id, :description, :execution_start_date, :execution_end_date, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province, :requested_volunteers_num, :volunteers_profile, :volunteer_functions_1, :volunteer_functions_2, :volunteer_functions_3)
    end
end
