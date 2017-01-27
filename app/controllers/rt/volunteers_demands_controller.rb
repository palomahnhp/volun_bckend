class Rt::VolunteersDemandsController < ApplicationController

  load_and_authorize_resource instance_name: :rt_volunteers_demand
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::VolunteersDemand.ransack_default
    @search_q = @rt_volunteers_demands.search(params[:q])
    @rt_volunteers_demands = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_volunteers_demands)
  end

  def show
    respond_with(@rt_volunteers_demand) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    respond_with(@rt_volunteers_demand)
  end

  def edit
  end

  def create
    if @rt_volunteers_demand.save
      redirect_to request_forms_path
    else
      render :new
    end
  end

  def update
    if @rt_volunteers_demand.update(rt_volunteers_demand_params)
      redirect_to request_forms_path
    else
      render :edit
    end
  end

  def destroy
    @rt_volunteers_demand.destroy
    respond_with(@rt_volunteers_demand)
  end

  protected

    def rt_volunteers_demand_params
      params
        .require(:rt_volunteers_demand)
        .permit(
          :description,
          :execution_start_date,
          :execution_end_date,
          :road_type,
          :road_name,
          :number_type,
          :road_number,
          :postal_code,
          :town,
          :province,
          :requested_volunteers_num,
          :volunteers_profile,
          :volunteer_functions_1,
          :volunteer_functions_2,
          :volunteer_functions_3,
          request_form_attributes: request_form_attributes
        )
    end

    alias_method :create_params, :rt_volunteers_demand_params
end
