require 'rails_helper'

RSpec.describe Ent::TrackingsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :tracking
  }

  let(:invalid_attributes) {
    attributes_for :tracking, :invalid
  }

  describe "GET #index" do
    it 'assigns all ent_trackings as @ent_trackings' do
      tracking = Ent::Tracking.create! valid_attributes
      get :index
      expect(assigns(:ent_trackings)).to eq([tracking])
    end
  end

  describe "GET #show" do
    it 'assigns the requested ent_tracking as @ent_tracking' do
      tracking = Ent::Tracking.create! valid_attributes
      get :show, id: tracking.to_param
      expect(assigns(:ent_tracking)).to eq(tracking)
    end
  end

  describe "GET #new" do
    it 'assigns a new ent_tracking as @ent_tracking' do
      get :new
      expect(assigns(:ent_tracking)).to be_a_new(Ent::Tracking)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested ent_tracking as @ent_tracking' do
      tracking = Ent::Tracking.create! valid_attributes
      get :edit, id: tracking.to_param
      expect(assigns(:ent_tracking)).to eq(tracking)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Ent::Tracking' do
        expect {
          post :create, ent_tracking: valid_attributes
        }.to change(Ent::Tracking, :count).by(1)
      end

      it 'assigns a newly created ent_tracking as @ent_tracking' do
        post :create, ent_tracking: valid_attributes
        expect(assigns(:ent_tracking)).to be_a(Ent::Tracking)
        expect(assigns(:ent_tracking)).to be_persisted
      end

      it 'redirects to the created ent_tracking' do
        post :create, ent_tracking: valid_attributes
        expect(response).to redirect_to(ent_trackings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved ent_tracking as @ent_tracking' do
        post :create, ent_tracking: invalid_attributes
        expect(assigns(:ent_tracking)).to be_a_new(Ent::Tracking)
      end

      it 're-renders the "new" template' do
        post :create, ent_tracking: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested ent_tracking' do
        tracking = Ent::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, ent_tracking: new_attributes
        tracking.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested ent_tracking as @ent_tracking' do
        tracking = Ent::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, ent_tracking: valid_attributes
        expect(assigns(:ent_tracking)).to eq(tracking)
      end

      it 'redirects to ent_trackings' do
        tracking = Ent::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, ent_tracking: valid_attributes
        expect(response).to redirect_to(ent_trackings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the ent_tracking as @ent_tracking' do
        tracking = Ent::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, ent_tracking: invalid_attributes
        expect(assigns(:ent_tracking)).to eq(tracking)
      end

      it 're-renders the "edit" template' do
        tracking = Ent::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, ent_tracking: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested ent_tracking' do
      tracking = Ent::Tracking.create! valid_attributes
      expect {
        delete :destroy, id: tracking.to_param
      }.to change(Ent::Tracking, :count).by(tracking.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the ent_trackings list' do
      tracking = Ent::Tracking.create! valid_attributes
      delete :destroy, id: tracking.to_param
      expect(response).to redirect_to(ent_trackings_url)
    end
  end

end
