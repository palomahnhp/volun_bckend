require 'rails_helper'

RSpec.describe Volun::TrackingsController, type: :controller do
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
    it 'assigns all volun_trackings as @volun_trackings' do
      tracking = Volun::Tracking.create! valid_attributes
      get :index
      expect(assigns(:volun_trackings)).to eq([tracking])
    end
  end

  describe "GET #show" do
    it 'assigns the requested volun_tracking as @volun_tracking' do
      tracking = Volun::Tracking.create! valid_attributes
      get :show, id: tracking.to_param
      expect(assigns(:volun_tracking)).to eq(tracking)
    end
  end

  describe "GET #new" do
    it 'assigns a new volun_tracking as @volun_tracking' do
      get :new
      expect(assigns(:volun_tracking)).to be_a_new(Volun::Tracking)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested volun_tracking as @volun_tracking' do
      tracking = Volun::Tracking.create! valid_attributes
      get :edit, id: tracking.to_param
      expect(assigns(:volun_tracking)).to eq(tracking)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Volun::Tracking' do
        expect {
          post :create, volun_tracking: valid_attributes
        }.to change(Volun::Tracking, :count).by(1)
      end

      it 'assigns a newly created volun_tracking as @volun_tracking' do
        post :create, volun_tracking: valid_attributes
        expect(assigns(:volun_tracking)).to be_a(Volun::Tracking)
        expect(assigns(:volun_tracking)).to be_persisted
      end

      it 'redirects to the created volun_tracking' do
        post :create, volun_tracking: valid_attributes
        expect(response).to redirect_to(volun_trackings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved volun_tracking as @volun_tracking' do
        post :create, volun_tracking: invalid_attributes
        expect(assigns(:volun_tracking)).to be_a_new(Volun::Tracking)
      end

      it 're-renders the "new" template' do
        post :create, volun_tracking: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested volun_tracking' do
        tracking = Volun::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, volun_tracking: new_attributes
        tracking.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested volun_tracking as @volun_tracking' do
        tracking = Volun::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, volun_tracking: valid_attributes
        expect(assigns(:volun_tracking)).to eq(tracking)
      end

      it 'redirects to volun_trackings' do
        tracking = Volun::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, volun_tracking: valid_attributes
        expect(response).to redirect_to(volun_trackings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the volun_tracking as @volun_tracking' do
        tracking = Volun::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, volun_tracking: invalid_attributes
        expect(assigns(:volun_tracking)).to eq(tracking)
      end

      it 're-renders the "edit" template' do
        tracking = Volun::Tracking.create! valid_attributes
        put :update, id: tracking.to_param, volun_tracking: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested volun_tracking' do
      tracking = Volun::Tracking.create! valid_attributes
      expect {
        delete :destroy, id: tracking.to_param
      }.to change(Volun::Tracking, :count).by(tracking.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the volun_trackings list' do
      tracking = Volun::Tracking.create! valid_attributes
      delete :destroy, id: tracking.to_param
      expect(response).to redirect_to(volun_trackings_url)
    end
  end

end
