require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :address
  }

  let(:invalid_attributes) {
    attributes_for :address, :invalid
  }

  describe "GET #index" do
    it 'assigns all addresses as @addresses' do
      address = Address.create! valid_attributes
      get :index
      expect(assigns(:addresses)).to eq([address])
    end
  end

  describe "GET #show" do
    it 'assigns the requested address as @address' do
      address = Address.create! valid_attributes
      get :show, id: address.to_param
      expect(assigns(:address)).to eq(address)
    end
  end

  describe "GET #new" do
    it 'assigns a new address as @address' do
      get :new
      expect(assigns(:address)).to be_a_new(Address)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested address as @address' do
      address = Address.create! valid_attributes
      get :edit, id: address.to_param
      expect(assigns(:address)).to eq(address)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Address' do
        expect {
          post :create, address: valid_attributes
        }.to change(Address, :count).by(1)
      end

      it 'assigns a newly created address as @address' do
        post :create, address: valid_attributes
        expect(assigns(:address)).to be_a(Address)
        expect(assigns(:address)).to be_persisted
      end

      it 'redirects to the created address' do
        post :create, address: valid_attributes
        expect(response).to redirect_to(addresses_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved address as @address' do
        post :create, address: invalid_attributes
        expect(assigns(:address)).to be_a_new(Address)
      end

      it 're-renders the "new" template' do
        post :create, address: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested address' do
        address = Address.create! valid_attributes
        put :update, id: address.to_param, address: new_attributes
        address.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested address as @address' do
        address = Address.create! valid_attributes
        put :update, id: address.to_param, address: valid_attributes
        expect(assigns(:address)).to eq(address)
      end

      it 'redirects to addresses' do
        address = Address.create! valid_attributes
        put :update, id: address.to_param, address: valid_attributes
        expect(response).to redirect_to(addresses_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the address as @address' do
        address = Address.create! valid_attributes
        put :update, id: address.to_param, address: invalid_attributes
        expect(assigns(:address)).to eq(address)
      end

      it 're-renders the "edit" template' do
        skip("No posibility of invalid arguments, any of them is not null")
        address = Address.create! valid_attributes
        put :update, id: address.to_param, address: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested address' do
      address = Address.create! valid_attributes
      expect {
        delete :destroy, id: address.to_param
      }.to change(Address, :count).by(address.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the addresses list' do
      address = Address.create! valid_attributes
      delete :destroy, id: address.to_param
      expect(response).to redirect_to(addresses_url)
    end
  end

end
