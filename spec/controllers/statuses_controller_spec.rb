require 'rails_helper'

RSpec.describe StatusesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :status
  }

  let(:invalid_attributes) {
    attributes_for :status, :invalid
  }

  describe "GET #index" do
    it 'assigns all statuses as @statuses' do
      status = Status.create! valid_attributes
      get :index
      expect(assigns(:statuses)).to eq([status])
    end
  end

  describe "GET #show" do
    it 'assigns the requested status as @status' do
      status = Status.create! valid_attributes
      get :show, id: status.to_param
      expect(assigns(:status)).to eq(status)
    end
  end

  describe "GET #new" do
    it 'assigns a new status as @status' do
      get :new
      expect(assigns(:status)).to be_a_new(Status)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested status as @status' do
      status = Status.create! valid_attributes
      get :edit, id: status.to_param
      expect(assigns(:status)).to eq(status)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Status' do
        expect {
          post :create, status: valid_attributes
        }.to change(Status, :count).by(1)
      end

      it 'assigns a newly created status as @status' do
        post :create, status: valid_attributes
        expect(assigns(:status)).to be_a(Status)
        expect(assigns(:status)).to be_persisted
      end

      it 'redirects to the created status' do
        post :create, status: valid_attributes
        expect(response).to redirect_to(statuses_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved status as @status' do
        post :create, status: invalid_attributes
        expect(assigns(:status)).to be_a_new(Status)
      end

      it 're-renders the "new" template' do
        post :create, status: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested status' do
        status = Status.create! valid_attributes
        put :update, id: status.to_param, status: new_attributes
        status.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested status as @status' do
        status = Status.create! valid_attributes
        put :update, id: status.to_param, status: valid_attributes
        expect(assigns(:status)).to eq(status)
      end

      it 'redirects to statuses' do
        status = Status.create! valid_attributes
        put :update, id: status.to_param, status: valid_attributes
        expect(response).to redirect_to(statuses_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the status as @status' do
        status = Status.create! valid_attributes
        put :update, id: status.to_param, status: invalid_attributes
        expect(assigns(:status)).to eq(status)
      end

      it 're-renders the "edit" template' do
        status = Status.create! valid_attributes
        put :update, id: status.to_param, status: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested status' do
      status = Status.create! valid_attributes
      expect {
        delete :destroy, id: status.to_param
      }.to change(Status, :count).by(status.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the statuses list' do
      status = Status.create! valid_attributes
      delete :destroy, id: status.to_param
      expect(response).to redirect_to(statuses_url)
    end
  end

end
