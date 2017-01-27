require 'rails_helper'

RSpec.describe ContactTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :contact_type
  }

  let(:invalid_attributes) {
    attributes_for :contact_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all contact_types as @contact_types' do
      contact_type = ContactType.create! valid_attributes
      get :index
      expect(assigns(:contact_types)).to eq([contact_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested contact_type as @contact_type' do
      contact_type = ContactType.create! valid_attributes
      get :show, id: contact_type.to_param
      expect(assigns(:contact_type)).to eq(contact_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new contact_type as @contact_type' do
      get :new
      expect(assigns(:contact_type)).to be_a_new(ContactType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested contact_type as @contact_type' do
      contact_type = ContactType.create! valid_attributes
      get :edit, id: contact_type.to_param
      expect(assigns(:contact_type)).to eq(contact_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new ContactType' do
        expect {
          post :create, contact_type: valid_attributes
        }.to change(ContactType, :count).by(1)
      end

      it 'assigns a newly created contact_type as @contact_type' do
        post :create, contact_type: valid_attributes
        expect(assigns(:contact_type)).to be_a(ContactType)
        expect(assigns(:contact_type)).to be_persisted
      end

      it 'redirects to the created contact_type' do
        post :create, contact_type: valid_attributes
        expect(response).to redirect_to(contact_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved contact_type as @contact_type' do
        post :create, contact_type: invalid_attributes
        expect(assigns(:contact_type)).to be_a_new(ContactType)
      end

      it 're-renders the "new" template' do
        post :create, contact_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested contact_type' do
        contact_type = ContactType.create! valid_attributes
        put :update, id: contact_type.to_param, contact_type: new_attributes
        contact_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested contact_type as @contact_type' do
        contact_type = ContactType.create! valid_attributes
        put :update, id: contact_type.to_param, contact_type: valid_attributes
        expect(assigns(:contact_type)).to eq(contact_type)
      end

      it 'redirects to contact_types' do
        contact_type = ContactType.create! valid_attributes
        put :update, id: contact_type.to_param, contact_type: valid_attributes
        expect(response).to redirect_to(contact_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the contact_type as @contact_type' do
        contact_type = ContactType.create! valid_attributes
        put :update, id: contact_type.to_param, contact_type: invalid_attributes
        expect(assigns(:contact_type)).to eq(contact_type)
      end

      it 're-renders the "edit" template' do
        contact_type = ContactType.create! valid_attributes
        put :update, id: contact_type.to_param, contact_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested contact_type' do
      contact_type = ContactType.create! valid_attributes
      expect {
        delete :destroy, id: contact_type.to_param
      }.to change(ContactType, :count).by(contact_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the contact_types list' do
      contact_type = ContactType.create! valid_attributes
      delete :destroy, id: contact_type.to_param
      expect(response).to redirect_to(contact_types_url)
    end
  end

end
