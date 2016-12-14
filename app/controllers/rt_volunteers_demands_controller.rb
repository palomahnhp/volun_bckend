class RtVolunteersDemandsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= RtVolunteersDemand.ransack_default
    @search_q = @rt_volunteers_demands.search(params[:q])
    @rt_volunteers_demands = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteers_demands)
  end

  def show
    respond_with(@rt_volunteers_demand) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def edit
  end

  def update
    @rt_volunteers_demand.update_attributes(rt_volunteers_demand_params)
    respond_with(@rt_volunteers_demand)
  end

  protected

    def rt_volunteers_demand_params
      params.require(:rt_volunteers_demand).permit(:description, :execution_start_date, :execution_end_date, :road_type, :road_name, :number_type, :road_number, :postal_code, :town, :province, :requested_volunteers_num, :volunteers_profile, :volunteer_functions_1, :volunteer_functions_2, :volunteer_functions_3)
    end
end
