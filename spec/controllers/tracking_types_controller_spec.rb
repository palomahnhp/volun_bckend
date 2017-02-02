require 'rails_helper'

RSpec.describe TrackingTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :tracking_type
  }

  let(:invalid_attributes) {
    attributes_for :tracking_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all tracking_types as @tracking_types' do
      tracking_type = TrackingType.create! valid_attributes
      get :index
      expect(assigns(:tracking_types)).to eq([tracking_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested tracking_type as @tracking_type' do
      tracking_type = TrackingType.create! valid_attributes
      get :show, id: tracking_type.to_param
      expect(assigns(:tracking_type)).to eq(tracking_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new tracking_type as @tracking_type' do
      get :new
      expect(assigns(:tracking_type)).to be_a_new(TrackingType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested tracking_type as @tracking_type' do
      tracking_type = TrackingType.create! valid_attributes
      get :edit, id: tracking_type.to_param
      expect(assigns(:tracking_type)).to eq(tracking_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new TrackingType' do
        expect {
          post :create, tracking_type: valid_attributes
        }.to change(TrackingType, :count).by(1)
      end

      it 'assigns a newly created tracking_type as @tracking_type' do
        post :create, tracking_type: valid_attributes
        expect(assigns(:tracking_type)).to be_a(TrackingType)
        expect(assigns(:tracking_type)).to be_persisted
      end

      it 'redirects to the created tracking_type' do
        post :create, tracking_type: valid_attributes
        expect(response).to redirect_to(tracking_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved tracking_type as @tracking_type' do
        post :create, tracking_type: invalid_attributes
        expect(assigns(:tracking_type)).to be_a_new(TrackingType)
      end

      it 're-renders the "new" template' do
        post :create, tracking_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested tracking_type' do
        tracking_type = TrackingType.create! valid_attributes
        put :update, id: tracking_type.to_param, tracking_type: new_attributes
        tracking_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested tracking_type as @tracking_type' do
        tracking_type = TrackingType.create! valid_attributes
        put :update, id: tracking_type.to_param, tracking_type: valid_attributes
        expect(assigns(:tracking_type)).to eq(tracking_type)
      end

      it 'redirects to tracking_types' do
        tracking_type = TrackingType.create! valid_attributes
        put :update, id: tracking_type.to_param, tracking_type: valid_attributes
        expect(response).to redirect_to(tracking_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the tracking_type as @tracking_type' do
        tracking_type = TrackingType.create! valid_attributes
        put :update, id: tracking_type.to_param, tracking_type: invalid_attributes
        expect(assigns(:tracking_type)).to eq(tracking_type)
      end

      it 're-renders the "edit" template' do
        tracking_type = TrackingType.create! valid_attributes
        put :update, id: tracking_type.to_param, tracking_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested tracking_type' do
      tracking_type = TrackingType.create! valid_attributes
      expect {
        delete :destroy, id: tracking_type.to_param
      }.to change(TrackingType, :count).by(tracking_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the tracking_types list' do
      tracking_type = TrackingType.create! valid_attributes
      delete :destroy, id: tracking_type.to_param
      expect(response).to redirect_to(tracking_types_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested tracking type' do
      tracking_type = TrackingType.create! valid_attributes
      delete :destroy, id: tracking_type.to_param
      post :recover, id: tracking_type.to_param
      expect(tracking_type.active).to eq(true)
    end

    it 'redirects to the tracking_types list' do
      tracking_type = TrackingType.create! valid_attributes
      post :recover, id: tracking_type.to_param
      expect(response).to redirect_to(tracking_types_url)
    end
  end

end
