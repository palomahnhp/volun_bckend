require 'rails_helper'

RSpec.describe Pro::TrackingsController, type: :controller do
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
    it 'assigns all pro_trackings as @pro_trackings' do
      tracking = Pro::Tracking.create! valid_attributes
      get :index
      expect(assigns(:pro_trackings)).to eq([tracking])
    end
  end

  describe "GET #show" do
    it 'assigns the requested pro_tracking as @pro_tracking' do
      tracking = Pro::Tracking.create! valid_attributes
      get :show, id: tracking.to_param
      expect(assigns(:pro_tracking)).to eq(tracking)
    end
  end

  describe "GET #new" do
    it 'assigns a new pro_tracking as @pro_tracking' do
      get :new
      expect(assigns(:pro_tracking)).to be_a_new(Pro::Tracking)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested pro_tracking as @pro_tracking' do
      tracking = Pro::Tracking.create! valid_attributes
      get :edit, id: tracking.to_param
      expect(assigns(:pro_tracking)).to eq(tracking)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Pro::Tracking' do
        expect {
          post :create, pro_tracking: valid_attributes
        }.to change(Pro::Tracking, :count).by(1)
      end

      it 'assigns a newly created pro_tracking as @pro_tracking' do
        post :create, pro_tracking: valid_attributes
        expect(assigns(:pro_tracking)).to be_a(Pro::Tracking)
        expect(assigns(:pro_tracking)).to be_persisted
      end

      it 'redirects to the created pro_tracking' do
        post :create, pro_tracking: valid_attributes
        expect(response).to redirect_to(pro_trackings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved pro_tracking as @pro_tracking' do
        post :create, pro_tracking: invalid_attributes
        expect(assigns(:pro_tracking)).to be_a_new(Pro::Tracking)
      end

      it 're-renders the "new" template' do
        post :create, pro_tracking: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested pro_tracking' do
        tracking = Pro::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, pro_tracking: new_attributes
        tracking.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested pro_tracking as @pro_tracking' do
        tracking = Pro::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, pro_tracking: valid_attributes
        expect(assigns(:pro_tracking)).to eq(tracking)
      end

      it 'redirects to pro_trackings' do
        tracking = Pro::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, pro_tracking: valid_attributes
        expect(response).to redirect_to(pro_trackings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the pro_tracking as @pro_tracking' do
        tracking = Pro::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, pro_tracking: invalid_attributes
        expect(assigns(:pro_tracking)).to eq(tracking)
      end

      it 're-renders the "edit" template' do
        tracking = Pro::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, pro_tracking: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested pro_tracking' do
      tracking = Pro::Tracking.create! valid_attributes
      expect {
        delete :destroy, id: tracking.to_param
      }.to change(Pro::Tracking, :count).by(tracking.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the pro_trackings list' do
      tracking = Pro::Tracking.create! valid_attributes
      delete :destroy, id: tracking.to_param
      expect(response).to redirect_to(pro_trackings_url)
    end
  end

end
