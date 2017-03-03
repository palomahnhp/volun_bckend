require 'rails_helper'

RSpec.describe Req::RejectionTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :rejection_type
  }

  let(:invalid_attributes) {
    attributes_for :rejection_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all req_rejection_types as @req_rejection_types' do
      rejection_type = Req::RejectionType.create! valid_attributes
      get :index
      expect(assigns(:req_rejection_types)).to eq([rejection_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested req_rejection_type as @req_rejection_type' do
      rejection_type = Req::RejectionType.create! valid_attributes
      get :show, id: rejection_type.to_param
      expect(assigns(:req_rejection_type)).to eq(rejection_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new req_rejection_type as @req_rejection_type' do
      get :new
      expect(assigns(:req_rejection_type)).to be_a_new(Req::RejectionType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested req_rejection_type as @req_rejection_type' do
      rejection_type = Req::RejectionType.create! valid_attributes
      get :edit, id: rejection_type.to_param
      expect(assigns(:req_rejection_type)).to eq(rejection_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Req::RejectionType' do
        expect {
          post :create, req_rejection_type: valid_attributes
        }.to change(Req::RejectionType, :count).by(1)
      end

      it 'assigns a newly created req_rejection_type as @req_rejection_type' do
        post :create, req_rejection_type: valid_attributes
        expect(assigns(:req_rejection_type)).to be_a(Req::RejectionType)
        expect(assigns(:req_rejection_type)).to be_persisted
      end

      it 'redirects to the created req_rejection_type' do
        post :create, req_rejection_type: valid_attributes
        expect(response).to redirect_to(req_rejection_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved req_rejection_type as @req_rejection_type' do
        post :create, req_rejection_type: invalid_attributes
        expect(assigns(:req_rejection_type)).to be_a_new(Req::RejectionType)
      end

      it 're-renders the "new" template' do
        post :create, req_rejection_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested req_rejection_type' do
        rejection_type = Req::RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, req_rejection_type: new_attributes
        rejection_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested req_rejection_type as @req_rejection_type' do
        rejection_type = Req::RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, req_rejection_type: valid_attributes
        expect(assigns(:req_rejection_type)).to eq(rejection_type)
      end

      it 'redirects to req_rejection_types' do
        rejection_type = Req::RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, req_rejection_type: valid_attributes
        expect(response).to redirect_to(req_rejection_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the req_rejection_type as @req_rejection_type' do
        rejection_type = Req::RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, req_rejection_type: invalid_attributes
        expect(assigns(:req_rejection_type)).to eq(rejection_type)
      end

      it 're-renders the "edit" template' do
        rejection_type = Req::RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, req_rejection_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested req_rejection_type' do
      rejection_type = Req::RejectionType.create! valid_attributes
      expect {
        delete :destroy, id: rejection_type.to_param
      }.to change(Req::RejectionType, :count).by(rejection_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the req_rejection_types list' do
      rejection_type = Req::RejectionType.create! valid_attributes
      delete :destroy, id: rejection_type.to_param
      expect(response).to redirect_to(req_rejection_types_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested rejection_type' do
      rejection_type = Req::RejectionType.create! valid_attributes
      delete :destroy, id: rejection_type.to_param
      post :recover, id: rejection_type.to_param
      expect(rejection_type.active).to eq(true)
    end

    it 'redirects to the rejection_types list' do
      rejection_type = Req::RejectionType.create! valid_attributes
      post :recover, id: rejection_type.to_param
      expect(response).to redirect_to(req_rejection_types_url)
    end
  end

end
