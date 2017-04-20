require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :resource
  }

  let(:invalid_attributes) {
    attributes_for :resource, :invalid
  }

  describe "GET #index" do
    it 'assigns all resources as @resources' do
      resource = Resource.create! valid_attributes
      get :index
      expect(assigns(:resources)).to eq([resource])
    end
  end

  describe "GET #show" do
    it 'assigns the requested resource as @resource' do
      resource = Resource.create! valid_attributes
      get :show, id: resource.to_param
      expect(assigns(:resource)).to eq(resource)
    end
  end

  describe "GET #new" do
    it 'assigns a new resource as @resource' do
      get :new
      expect(assigns(:resource)).to be_a_new(Resource)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested resource as @resource' do
      resource = Resource.create! valid_attributes
      get :edit, id: resource.to_param
      expect(assigns(:resource)).to eq(resource)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Resource' do
        expect {
          post :create, resource: valid_attributes
        }.to change(Resource, :count).by(1)
      end

      it 'assigns a newly created resource as @resource' do
        post :create, resource: valid_attributes
        expect(assigns(:resource)).to be_a(Resource)
        expect(assigns(:resource)).to be_persisted
      end

      it 'redirects to the created resource' do
        post :create, resource: valid_attributes
        expect(response).to redirect_to(resources_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved resource as @resource' do
        post :create, resource: invalid_attributes
        expect(assigns(:resource)).to be_a_new(Resource)
      end

      it 're-renders the "new" template' do
        post :create, resource: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested resource' do
        resource = Resource.create! valid_attributes
        put :update, id: resource.to_param, resource: new_attributes
        resource.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested resource as @resource' do
        resource = Resource.create! valid_attributes
        put :update, id: resource.to_param, resource: valid_attributes
        expect(assigns(:resource)).to eq(resource)
      end

      it 'redirects to resources' do
        resource = Resource.create! valid_attributes
        put :update, id: resource.to_param, resource: valid_attributes
        expect(response).to redirect_to(resources_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the resource as @resource' do
        resource = Resource.create! valid_attributes
        put :update, id: resource.to_param, resource: invalid_attributes
        expect(assigns(:resource)).to eq(resource)
      end

      it 're-renders the "edit" template' do
        resource = Resource.create! valid_attributes
        put :update, id: resource.to_param, resource: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested resource' do
      resource = Resource.create! valid_attributes
      expect {
        delete :destroy, id: resource.to_param
      }.to change(Resource, :count).by(resource.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the resources list' do
      resource = Resource.create! valid_attributes
      delete :destroy, id: resource.to_param
      expect(response).to redirect_to(resources_url)
    end
  end

end
