require 'rails_helper'

RSpec.describe RequestReasonsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :request_reason
  }

  let(:invalid_attributes) {
    attributes_for :request_reason, :invalid
  }

  describe "GET #index" do
    it 'assigns all request_reasons as @request_reasons' do
      request_reason = RequestReason.create! valid_attributes
      get :index
      expect(assigns(:request_reasons)).to eq([request_reason])
    end
  end

  describe "GET #show" do
    it 'assigns the requested request_reason as @request_reason' do
      request_reason = RequestReason.create! valid_attributes
      get :show, id: request_reason.to_param
      expect(assigns(:request_reason)).to eq(request_reason)
    end
  end

  describe "GET #new" do
    it 'assigns a new request_reason as @request_reason' do
      get :new
      expect(assigns(:request_reason)).to be_a_new(RequestReason)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested request_reason as @request_reason' do
      request_reason = RequestReason.create! valid_attributes
      get :edit, id: request_reason.to_param
      expect(assigns(:request_reason)).to eq(request_reason)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new RequestReason' do
        expect {
          post :create, request_reason: valid_attributes
        }.to change(RequestReason, :count).by(1)
      end

      it 'assigns a newly created request_reason as @request_reason' do
        post :create, request_reason: valid_attributes
        expect(assigns(:request_reason)).to be_a(RequestReason)
        expect(assigns(:request_reason)).to be_persisted
      end

      it 'redirects to the created request_reason' do
        post :create, request_reason: valid_attributes
        expect(response).to redirect_to(request_reasons_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved request_reason as @request_reason' do
        post :create, request_reason: invalid_attributes
        expect(assigns(:request_reason)).to be_a_new(RequestReason)
      end

      it 're-renders the "new" template' do
        post :create, request_reason: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested request_reason' do
        request_reason = RequestReason.create! valid_attributes
        put :update, id: request_reason.to_param, request_reason: new_attributes
        request_reason.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested request_reason as @request_reason' do
        request_reason = RequestReason.create! valid_attributes
        put :update, id: request_reason.to_param, request_reason: valid_attributes
        expect(assigns(:request_reason)).to eq(request_reason)
      end

      it 'redirects to request_reasons' do
        request_reason = RequestReason.create! valid_attributes
        put :update, id: request_reason.to_param, request_reason: valid_attributes
        expect(response).to redirect_to(request_reasons_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the request_reason as @request_reason' do
        request_reason = RequestReason.create! valid_attributes
        put :update, id: request_reason.to_param, request_reason: invalid_attributes
        expect(assigns(:request_reason)).to eq(request_reason)
      end

      it 're-renders the "edit" template' do
        request_reason = RequestReason.create! valid_attributes
        put :update, id: request_reason.to_param, request_reason: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested request_reason' do
      request_reason = RequestReason.create! valid_attributes
      expect {
        delete :destroy, id: request_reason.to_param
      }.to change(RequestReason, :count).by(request_reason.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the request_reasons list' do
      request_reason = RequestReason.create! valid_attributes
      delete :destroy, id: request_reason.to_param
      expect(response).to redirect_to(request_reasons_url)
    end
  end

end
