require 'rails_helper'

RSpec.describe UnsubscribeReasonsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :unsubscribe_reason
  }

  let(:invalid_attributes) {
    attributes_for :unsubscribe_reason, :invalid
  }

  describe "GET #index" do
    it 'assigns all unsubscribe_reasons as @unsubscribe_reasons' do
      unsubscribe_reason = UnsubscribeReason.create! valid_attributes
      get :index
      expect(assigns(:unsubscribe_reasons)).to eq([unsubscribe_reason])
    end
  end

  describe "GET #show" do
    it 'assigns the requested unsubscribe_reason as @unsubscribe_reason' do
      unsubscribe_reason = UnsubscribeReason.create! valid_attributes
      get :show, id: unsubscribe_reason.to_param
      expect(assigns(:unsubscribe_reason)).to eq(unsubscribe_reason)
    end
  end

  describe "GET #new" do
    it 'assigns a new unsubscribe_reason as @unsubscribe_reason' do
      get :new
      expect(assigns(:unsubscribe_reason)).to be_a_new(UnsubscribeReason)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested unsubscribe_reason as @unsubscribe_reason' do
      unsubscribe_reason = UnsubscribeReason.create! valid_attributes
      get :edit, id: unsubscribe_reason.to_param
      expect(assigns(:unsubscribe_reason)).to eq(unsubscribe_reason)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new UnsubscribeReason' do
        expect {
          post :create, unsubscribe_reason: valid_attributes
        }.to change(UnsubscribeReason, :count).by(1)
      end

      it 'assigns a newly created unsubscribe_reason as @unsubscribe_reason' do
        post :create, unsubscribe_reason: valid_attributes
        expect(assigns(:unsubscribe_reason)).to be_a(UnsubscribeReason)
        expect(assigns(:unsubscribe_reason)).to be_persisted
      end

      it 'redirects to the created unsubscribe_reason' do
        post :create, unsubscribe_reason: valid_attributes
        expect(response).to redirect_to(unsubscribe_reasons_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved unsubscribe_reason as @unsubscribe_reason' do
        post :create, unsubscribe_reason: invalid_attributes
        expect(assigns(:unsubscribe_reason)).to be_a_new(UnsubscribeReason)
      end

      it 're-renders the "new" template' do
        post :create, unsubscribe_reason: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested unsubscribe_reason' do
        unsubscribe_reason = UnsubscribeReason.create! valid_attributes
        put :update, id: unsubscribe_reason.to_param, unsubscribe_reason: new_attributes
        unsubscribe_reason.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested unsubscribe_reason as @unsubscribe_reason' do
        unsubscribe_reason = UnsubscribeReason.create! valid_attributes
        put :update, id: unsubscribe_reason.to_param, unsubscribe_reason: valid_attributes
        expect(assigns(:unsubscribe_reason)).to eq(unsubscribe_reason)
      end

      it 'redirects to unsubscribe_reasons' do
        unsubscribe_reason = UnsubscribeReason.create! valid_attributes
        put :update, id: unsubscribe_reason.to_param, unsubscribe_reason: valid_attributes
        expect(response).to redirect_to(unsubscribe_reasons_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the unsubscribe_reason as @unsubscribe_reason' do
        unsubscribe_reason = UnsubscribeReason.create! valid_attributes
        put :update, id: unsubscribe_reason.to_param, unsubscribe_reason: invalid_attributes
        expect(assigns(:unsubscribe_reason)).to eq(unsubscribe_reason)
      end

      it 're-renders the "edit" template' do
        unsubscribe_reason = UnsubscribeReason.create! valid_attributes
        put :update, id: unsubscribe_reason.to_param, unsubscribe_reason: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested unsubscribe_reason' do
      unsubscribe_reason = UnsubscribeReason.create! valid_attributes
      expect {
        delete :destroy, id: unsubscribe_reason.to_param
      }.to change(UnsubscribeReason, :count).by(unsubscribe_reason.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the unsubscribe_reasons list' do
      unsubscribe_reason = UnsubscribeReason.create! valid_attributes
      delete :destroy, id: unsubscribe_reason.to_param
      expect(response).to redirect_to(unsubscribe_reasons_url)
    end
  end

end
