require 'rails_helper'

RSpec.describe EmploymentStatusesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :employment_status
  }

  let(:invalid_attributes) {
    attributes_for :employment_status, :invalid
  }

  describe "GET #index" do
    it 'assigns all employment_statuses as @employment_statuses' do
      employment_status = EmploymentStatus.create! valid_attributes
      get :index
      expect(assigns(:employment_statuses)).to eq([employment_status])
    end
  end

  describe "GET #show" do
    it 'assigns the requested employment_status as @employment_status' do
      employment_status = EmploymentStatus.create! valid_attributes
      get :show, id: employment_status.to_param
      expect(assigns(:employment_status)).to eq(employment_status)
    end
  end

  describe "GET #new" do
    it 'assigns a new employment_status as @employment_status' do
      get :new
      expect(assigns(:employment_status)).to be_a_new(EmploymentStatus)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested employment_status as @employment_status' do
      employment_status = EmploymentStatus.create! valid_attributes
      get :edit, id: employment_status.to_param
      expect(assigns(:employment_status)).to eq(employment_status)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new EmploymentStatus' do
        expect {
          post :create, employment_status: valid_attributes
        }.to change(EmploymentStatus, :count).by(1)
      end

      it 'assigns a newly created employment_status as @employment_status' do
        post :create, employment_status: valid_attributes
        expect(assigns(:employment_status)).to be_a(EmploymentStatus)
        expect(assigns(:employment_status)).to be_persisted
      end

      it 'redirects to the created employment_status' do
        post :create, employment_status: valid_attributes
        expect(response).to redirect_to(employment_statuses_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved employment_status as @employment_status' do
        post :create, employment_status: invalid_attributes
        expect(assigns(:employment_status)).to be_a_new(EmploymentStatus)
      end

      it 're-renders the "new" template' do
        post :create, employment_status: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested employment_status' do
        employment_status = EmploymentStatus.create! valid_attributes
        put :update, id: employment_status.to_param, employment_status: new_attributes
        employment_status.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested employment_status as @employment_status' do
        employment_status = EmploymentStatus.create! valid_attributes
        put :update, id: employment_status.to_param, employment_status: valid_attributes
        expect(assigns(:employment_status)).to eq(employment_status)
      end

      it 'redirects to employment_statuses' do
        employment_status = EmploymentStatus.create! valid_attributes
        put :update, id: employment_status.to_param, employment_status: valid_attributes
        expect(response).to redirect_to(employment_statuses_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the employment_status as @employment_status' do
        employment_status = EmploymentStatus.create! valid_attributes
        put :update, id: employment_status.to_param, employment_status: invalid_attributes
        expect(assigns(:employment_status)).to eq(employment_status)
      end

      it 're-renders the "edit" template' do
        employment_status = EmploymentStatus.create! valid_attributes
        put :update, id: employment_status.to_param, employment_status: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested employment_status' do
      employment_status = EmploymentStatus.create! valid_attributes
      expect {
        delete :destroy, id: employment_status.to_param
      }.to change(EmploymentStatus, :count).by(employment_status.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the employment_statuses list' do
      employment_status = EmploymentStatus.create! valid_attributes
      delete :destroy, id: employment_status.to_param
      expect(response).to redirect_to(employment_statuses_url)
    end
  end

end
