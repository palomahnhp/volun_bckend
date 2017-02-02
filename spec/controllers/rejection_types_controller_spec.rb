require 'rails_helper'

RSpec.describe RejectionTypesController, type: :controller do
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
    it 'assigns all rejection_types as @rejection_types' do
      rejection_type = RejectionType.create! valid_attributes
      get :index
      expect(assigns(:rejection_types)).to eq([rejection_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rejection_type as @rejection_type' do
      rejection_type = RejectionType.create! valid_attributes
      get :show, id: rejection_type.to_param
      expect(assigns(:rejection_type)).to eq(rejection_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new rejection_type as @rejection_type' do
      get :new
      expect(assigns(:rejection_type)).to be_a_new(RejectionType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rejection_type as @rejection_type' do
      rejection_type = RejectionType.create! valid_attributes
      get :edit, id: rejection_type.to_param
      expect(assigns(:rejection_type)).to eq(rejection_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new RejectionType' do
        expect {
          post :create, rejection_type: valid_attributes
        }.to change(RejectionType, :count).by(1)
      end

      it 'assigns a newly created rejection_type as @rejection_type' do
        post :create, rejection_type: valid_attributes
        expect(assigns(:rejection_type)).to be_a(RejectionType)
        expect(assigns(:rejection_type)).to be_persisted
      end

      it 'redirects to the created rejection_type' do
        post :create, rejection_type: valid_attributes
        expect(response).to redirect_to(rejection_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rejection_type as @rejection_type' do
        post :create, rejection_type: invalid_attributes
        expect(assigns(:rejection_type)).to be_a_new(RejectionType)
      end

      it 're-renders the "new" template' do
        post :create, rejection_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rejection_type' do
        rejection_type = RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, rejection_type: new_attributes
        rejection_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rejection_type as @rejection_type' do
        rejection_type = RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, rejection_type: valid_attributes
        expect(assigns(:rejection_type)).to eq(rejection_type)
      end

      it 'redirects to rejection_types' do
        rejection_type = RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, rejection_type: valid_attributes
        expect(response).to redirect_to(rejection_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rejection_type as @rejection_type' do
        rejection_type = RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, rejection_type: invalid_attributes
        expect(assigns(:rejection_type)).to eq(rejection_type)
      end

      it 're-renders the "edit" template' do
        rejection_type = RejectionType.create! valid_attributes
        put :update, id: rejection_type.to_param, rejection_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rejection_type' do
      rejection_type = RejectionType.create! valid_attributes
      expect {
        delete :destroy, id: rejection_type.to_param
      }.to change(RejectionType, :count).by(rejection_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rejection_types list' do
      rejection_type = RejectionType.create! valid_attributes
      delete :destroy, id: rejection_type.to_param
      expect(response).to redirect_to(rejection_types_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested rejection_type' do
      rejection_type = RejectionType.create! valid_attributes
      delete :destroy, id: rejection_type.to_param
      post :recover, id: rejection_type.to_param
      expect(rejection_type.active).to eq(true)
    end

    it 'redirects to the rejection_types list' do
      rejection_type = RejectionType.create! valid_attributes
      post :recover, id: rejection_type.to_param
      expect(response).to redirect_to(rejection_types_url)
    end
  end

end
