require 'rails_helper'

RSpec.describe Volun::AvailabilitiesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :availability
  }

  let(:invalid_attributes) {
    attributes_for :availability, :invalid
  }

  describe "GET #index" do
    it 'assigns all volun_availabilities as @volun_availabilities' do
      availability = Volun::Availability.create! valid_attributes
      get :index
      expect(assigns(:volun_availabilities)).to eq([availability])
    end
  end

  describe "GET #show" do
    it 'assigns the requested volun_availability as @volun_availability' do
      availability = Volun::Availability.create! valid_attributes
      get :show, id: availability.to_param
      expect(assigns(:volun_availability)).to eq(availability)
    end
  end

  describe "GET #new" do
    it 'assigns a new volun_availability as @volun_availability' do
      get :new
      expect(assigns(:volun_availability)).to be_a_new(Volun::Availability)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested volun_availability as @volun_availability' do
      availability = Volun::Availability.create! valid_attributes
      get :edit, id: availability.to_param
      expect(assigns(:volun_availability)).to eq(availability)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Volun::Availability' do
        expect {
          post :create, volun_availability: valid_attributes
        }.to change(Volun::Availability, :count).by(1)
      end

      it 'assigns a newly created volun_availability as @volun_availability' do
        post :create, volun_availability: valid_attributes
        expect(assigns(:volun_availability)).to be_a(Volun::Availability)
        expect(assigns(:volun_availability)).to be_persisted
      end

      it 'redirects to the created volun_availability' do
        post :create, volun_availability: valid_attributes
        expect(response).to redirect_to(volun_availabilities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved volun_availability as @volun_availability' do
        post :create, volun_availability: invalid_attributes
        expect(assigns(:volun_availability)).to be_a_new(Volun::Availability)
      end

      it 're-renders the "new" template' do
        post :create, volun_availability: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested volun_availability' do
        availability = Volun::Availability.create! valid_attributes
        put :update, id: availability.to_param, volun_availability: new_attributes
        availability.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested volun_availability as @volun_availability' do
        availability = Volun::Availability.create! valid_attributes
        put :update, id: availability.to_param, volun_availability: valid_attributes
        expect(assigns(:volun_availability)).to eq(availability)
      end

      it 'redirects to volun_availabilities' do
        availability = Volun::Availability.create! valid_attributes
        put :update, id: availability.to_param, volun_availability: valid_attributes
        expect(response).to redirect_to(volun_availabilities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the volun_availability as @volun_availability' do
        availability = Volun::Availability.create! valid_attributes
        put :update, id: availability.to_param, volun_availability: invalid_attributes
        expect(assigns(:volun_availability)).to eq(availability)
      end

      it 're-renders the "edit" template' do
        availability = Volun::Availability.create! valid_attributes
        put :update, id: availability.to_param, volun_availability: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested volun_availability' do
      availability = Volun::Availability.create! valid_attributes
      expect {
        delete :destroy, id: availability.to_param
      }.to change(Volun::Availability, :count).by(availability.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the volun_availabilities list' do
      availability = Volun::Availability.create! valid_attributes
      delete :destroy, id: availability.to_param
      expect(response).to redirect_to(volun_availabilities_url)
    end
  end

end
