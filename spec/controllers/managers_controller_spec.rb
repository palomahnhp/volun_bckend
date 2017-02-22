require 'rails_helper'

RSpec.describe ManagersController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :manager
  }

  let(:invalid_attributes) {
    attributes_for :manager, :invalid
  }

  describe "GET #index" do
    it 'assigns all managers as @managers' do
      manager = Manager.create! valid_attributes
      get :index
      expect(assigns(:managers)).to eq([manager])
    end
  end

  describe "GET #show" do
    it 'assigns the requested manager as @manager' do
      manager = Manager.create! valid_attributes
      get :show, id: manager.to_param
      expect(assigns(:manager)).to eq(manager)
    end
  end

  describe "GET #new" do
    it 'assigns a new manager as @manager' do
      get :new
      expect(assigns(:manager)).to be_a_new(Manager)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested manager as @manager' do
      manager = Manager.create! valid_attributes
      get :edit, id: manager.to_param
      expect(assigns(:manager)).to eq(manager)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Manager' do
        expect {
          post :create, manager: valid_attributes
        }.to change(Manager, :count).by(1)
      end

      it 'assigns a newly created manager as @manager' do
        post :create, manager: valid_attributes
        expect(assigns(:manager)).to be_a(Manager)
        expect(assigns(:manager)).to be_persisted
      end

      it 'redirects to the created manager' do
        post :create, manager: valid_attributes
        expect(response).to redirect_to(managers_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved manager as @manager' do
        post :create, manager: invalid_attributes
        expect(assigns(:manager)).to be_a_new(Manager)
      end

      it 're-renders the "new" template' do
        post :create, manager: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested manager' do
        manager = Manager.create! valid_attributes
        put :update, id: manager.to_param, manager: new_attributes
        manager.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested manager as @manager' do
        manager = Manager.create! valid_attributes
        put :update, id: manager.to_param, manager: valid_attributes
        expect(assigns(:manager)).to eq(manager)
      end

      it 'redirects to managers' do
        manager = Manager.create! valid_attributes
        put :update, id: manager.to_param, manager: valid_attributes
        expect(response).to redirect_to(managers_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the manager as @manager' do
        manager = Manager.create! valid_attributes
        put :update, id: manager.to_param, manager: invalid_attributes
        expect(assigns(:manager)).to eq(manager)
      end

      it 're-renders the "edit" template' do
        manager = Manager.create! valid_attributes
        put :update, id: manager.to_param, manager: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested manager' do
      manager = Manager.create! valid_attributes
      expect {
        delete :destroy, id: manager.to_param
      }.to change(Manager, :count).by(manager.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the managers list' do
      manager = Manager.create! valid_attributes
      delete :destroy, id: manager.to_param
      expect(response).to redirect_to(managers_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested manager' do
      manager = Manager.create! valid_attributes
      delete :destroy, id: manager.to_param
      post :recover, id: manager.to_param
      expect(manager.active).to eq(true)
    end

    it 'redirects to the managers list' do
      manager = Manager.create! valid_attributes
      post :recover, id: manager.to_param
      expect(response).to redirect_to(managers_url)
    end
  end

end
