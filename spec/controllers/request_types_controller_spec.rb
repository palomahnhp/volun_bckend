require 'rails_helper'

RSpec.describe RequestTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :request_type
  }

  let(:invalid_attributes) {
    attributes_for :request_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all request_types as @request_types' do
      request_type = RequestType.create! valid_attributes
      get :index
      expect(assigns(:request_types)).to eq([request_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested request_type as @request_type' do
      request_type = RequestType.create! valid_attributes
      get :show, id: request_type.to_param
      expect(assigns(:request_type)).to eq(request_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new request_type as @request_type' do
      get :new
      expect(assigns(:request_type)).to be_a_new(RequestType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested request_type as @request_type' do
      request_type = RequestType.create! valid_attributes
      get :edit, id: request_type.to_param
      expect(assigns(:request_type)).to eq(request_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new RequestType' do
        expect {
          post :create, request_type: valid_attributes
        }.to change(RequestType, :count).by(1)
      end

      it 'assigns a newly created request_type as @request_type' do
        post :create, request_type: valid_attributes
        expect(assigns(:request_type)).to be_a(RequestType)
        expect(assigns(:request_type)).to be_persisted
      end

      it 'redirects to the created request_type' do
        post :create, request_type: valid_attributes
        expect(response).to redirect_to(request_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved request_type as @request_type' do
        post :create, request_type: invalid_attributes
        expect(assigns(:request_type)).to be_a_new(RequestType)
      end

      it 're-renders the "new" template' do
        post :create, request_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested request_type' do
        request_type = RequestType.create! valid_attributes
        put :update, id: request_type.to_param, request_type: new_attributes
        request_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested request_type as @request_type' do
        request_type = RequestType.create! valid_attributes
        put :update, id: request_type.to_param, request_type: valid_attributes
        expect(assigns(:request_type)).to eq(request_type)
      end

      it 'redirects to request_types' do
        request_type = RequestType.create! valid_attributes
        put :update, id: request_type.to_param, request_type: valid_attributes
        expect(response).to redirect_to(request_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the request_type as @request_type' do
        request_type = RequestType.create! valid_attributes
        put :update, id: request_type.to_param, request_type: invalid_attributes
        expect(assigns(:request_type)).to eq(request_type)
      end

      it 're-renders the "edit" template' do
        request_type = RequestType.create! valid_attributes
        put :update, id: request_type.to_param, request_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested request_type' do
      request_type = RequestType.create! valid_attributes
      expect {
        delete :destroy, id: request_type.to_param
      }.to change(RequestType, :count).by(request_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the request_types list' do
      request_type = RequestType.create! valid_attributes
      delete :destroy, id: request_type.to_param
      expect(response).to redirect_to(request_types_url)
    end
  end

end
