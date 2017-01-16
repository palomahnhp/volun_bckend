class Volun::ContactsController < ApplicationController

  load_and_authorize_resource instance_name: :volun_contact
  respond_to :html, :js, :json

  def index
    params[:q] ||= Volun::Contact.ransack_default
    @search_q = @volun_contacts.search(params[:q])
    @volun_contacts = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@volun_contacts)
  end

  def show
    respond_with(@volun_contact) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    respond_with(@volun_contact)
  end

  def edit
  end

  def create
    @volun_contact.save
    respond_with(@volun_contact)
  end

  def update
    @volun_contact.update_attributes(volun_contact_params)
    respond_with(@volun_contact)
  end

  def destroy
    @volun_contact.destroy
    respond_with(@volun_contact)
  end

  protected

    def volun_contact_params
      params
        .require(:volun_contact)
        .permit(
          :volunteer_id,
          :contact_result_id,
          :project_id,
          :technician_id,
          :contact_date,
          :comments
        )
    end

  alias_method :create_params, :volun_contact_params

end
