require 'rails_helper'

RSpec.describe VolunteersController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :volunteer
  }

  let(:invalid_attributes) {
    attributes_for :volunteer, :invalid
  }

  describe "GET #index" do
    it 'assigns all volunteers as @volunteers' do
      @address = FactoryGirl.create(:address)
      @idNumerType = FactoryGirl.create(:id_number_type)
      valid_attributes[:address_id] = @address.id
      valid_attributes[:id_number_type_id] = @idNumerType.id
      volunteer = Volunteer.create! valid_attributes
      get :index
      expect(assigns(:volunteers)).to eq([volunteer])
    end
  end

  describe "GET #show" do
    it 'assigns the requested volunteer as @volunteer' do
      @address = FactoryGirl.create(:address)
      @idNumerType = FactoryGirl.create(:id_number_type)
      valid_attributes[:address_id] = @address.id
      valid_attributes[:id_number_type_id] = @idNumerType.id
      volunteer = Volunteer.create! valid_attributes
      get :show, id: volunteer.to_param
      expect(assigns(:volunteer)).to eq(volunteer)
    end
  end

  describe "GET #new" do
    it 'assigns a new volunteer as @volunteer' do
      get :new
      expect(assigns(:volunteer)).to be_a_new(Volunteer)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested volunteer as @volunteer' do
      @address = FactoryGirl.create(:address)
      @idNumerType = FactoryGirl.create(:id_number_type)
      valid_attributes[:address_id] = @address.id
      valid_attributes[:id_number_type_id] = @idNumerType.id
      volunteer = Volunteer.create! valid_attributes
      get :edit, id: volunteer.to_param
      expect(assigns(:volunteer)).to eq(volunteer)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Volunteer' do
          @address = FactoryGirl.create(:address)
          @idNumerType = FactoryGirl.create(:id_number_type)
          valid_attributes[:address_id] = @address.id
          valid_attributes[:id_number_type_id] = @idNumerType.id
        expect {
          volunteer = Volunteer.create! valid_attributes
        }.to change(Volunteer, :count).by(1)
      end

      it 'assigns a newly created volunteer as @volunteer' do
        @address = FactoryGirl.create(:address)
        @idNumerType = FactoryGirl.create(:id_number_type)
        valid_attributes[:address_id] = @address.id
        valid_attributes[:id_number_type_id] = @idNumerType.id
        volunteer = Volunteer.create! valid_attributes
        expect(volunteer).to be_a(Volunteer)
        expect(volunteer).to be_persisted
      end

      it 'redirects to the created volunteer' do
        @manager = FactoryGirl.create(:manager)
        @trackingType = FactoryGirl.create(:tracking_type)
        @address = FactoryGirl.create(:address)
        @idNumerType = FactoryGirl.create(:id_number_type)
        valid_attributes[:address_id] = @address.id
        valid_attributes[:id_number_type_id] = @idNumerType.id
        post :create, volunteer: valid_attributes
        expect(response).to redirect_to(volunteers_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved volunteer as @volunteer' do
        post :create, volunteer: invalid_attributes
        expect(assigns(:volunteer)).to be_a_new(Volunteer)
      end

      it 're-renders the "new" template' do
        post :create, volunteer: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested volunteer' do
        @address = FactoryGirl.create(:address)
        @idNumerType = FactoryGirl.create(:id_number_type)
        valid_attributes[:address_id] = @address.id
        valid_attributes[:id_number_type_id] = @idNumerType.id
        volunteer = Volunteer.create! valid_attributes
        put :update, id: volunteer.to_param, volunteer: new_attributes
        volunteer.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested volunteer as @volunteer' do
        @address = FactoryGirl.create(:address)
        @idNumerType = FactoryGirl.create(:id_number_type)
        valid_attributes[:address_id] = @address.id
        valid_attributes[:id_number_type_id] = @idNumerType.id
        volunteer = Volunteer.create! valid_attributes
        put :update, id: volunteer.to_param, volunteer: valid_attributes
        expect(assigns(:volunteer)).to eq(volunteer)
      end

      it 'redirects to volunteers' do
        @address = FactoryGirl.create(:address)
        @idNumerType = FactoryGirl.create(:id_number_type)
        valid_attributes[:address_id] = @address.id
        valid_attributes[:id_number_type_id] = @idNumerType.id
        volunteer = Volunteer.create! valid_attributes
        put :update, id: volunteer.to_param, volunteer: valid_attributes
        expect(response).to redirect_to(volunteers_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the volunteer as @volunteer' do
        @address = FactoryGirl.create(:address)
        @idNumerType = FactoryGirl.create(:id_number_type)
        valid_attributes[:address_id] = @address.id
        valid_attributes[:id_number_type_id] = @idNumerType.id
        volunteer = Volunteer.create! valid_attributes
        put :update, id: volunteer.to_param, volunteer: invalid_attributes
        expect(assigns(:volunteer)).to eq(volunteer)
      end

      it 're-renders the "edit" template' do
        @address = FactoryGirl.create(:address)
        @idNumerType = FactoryGirl.create(:id_number_type)
        valid_attributes[:address_id] = @address.id
        valid_attributes[:id_number_type_id] = @idNumerType.id
        volunteer = Volunteer.create! valid_attributes
        put :update, id: volunteer.to_param, volunteer: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested volunteer' do
      @address = FactoryGirl.create(:address)
      @idNumerType = FactoryGirl.create(:id_number_type)
      valid_attributes[:address_id] = @address.id
      valid_attributes[:id_number_type_id] = @idNumerType.id
      volunteer = Volunteer.create! valid_attributes
      expect {
        delete :destroy, id: volunteer.to_param
      }.to change(Volunteer, :count).by(volunteer.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the volunteers list' do
      @address = FactoryGirl.create(:address)
      @idNumerType = FactoryGirl.create(:id_number_type)
      valid_attributes[:address_id] = @address.id
      valid_attributes[:id_number_type_id] = @idNumerType.id
      volunteer = Volunteer.create! valid_attributes
      delete :destroy, id: volunteer.to_param
      expect(response).to redirect_to(volunteers_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested volunteer' do
      @address = FactoryGirl.create(:address)
      @idNumerType = FactoryGirl.create(:id_number_type)
      valid_attributes[:address_id] = @address.id
      valid_attributes[:id_number_type_id] = @idNumerType.id
      volunteer = Volunteer.create! valid_attributes
      delete :destroy, id: volunteer.to_param
      post :recover, id: volunteer.to_param
      expect(volunteer.active).to eq(true)
    end

    it 'redirects to the volunteers list' do
      @address = FactoryGirl.create(:address)
      @idNumerType = FactoryGirl.create(:id_number_type)
      valid_attributes[:address_id] = @address.id
      valid_attributes[:id_number_type_id] = @idNumerType.id
      volunteer = Volunteer.create! valid_attributes
      post :recover, id: volunteer.to_param
      expect(response).to redirect_to(volunteers_url)
    end
  end

end
