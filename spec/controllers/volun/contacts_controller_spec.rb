require 'rails_helper'

RSpec.describe Volun::ContactsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :contact
  }

  let(:invalid_attributes) {
    attributes_for :contact, :invalid
  }

  describe "GET #index" do
    it 'assigns all volun_contacts as @volun_contacts' do
      contact = Volun::Contact.create! valid_attributes
      get :index
      expect(assigns(:volun_contacts)).to eq([contact])
    end
  end

  describe "GET #show" do
    it 'assigns the requested volun_contact as @volun_contact' do
      contact = Volun::Contact.create! valid_attributes
      get :show, id: contact.to_param
      expect(assigns(:volun_contact)).to eq(contact)
    end
  end

  describe "GET #new" do
    it 'assigns a new volun_contact as @volun_contact' do
      get :new
      expect(assigns(:volun_contact)).to be_a_new(Volun::Contact)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested volun_contact as @volun_contact' do
      contact = Volun::Contact.create! valid_attributes
      get :edit, id: contact.to_param
      expect(assigns(:volun_contact)).to eq(contact)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Volun::Contact' do
        expect {
          post :create, volun_contact: valid_attributes
        }.to change(Volun::Contact, :count).by(1)
      end

      it 'assigns a newly created volun_contact as @volun_contact' do
        post :create, volun_contact: valid_attributes
        expect(assigns(:volun_contact)).to be_a(Volun::Contact)
        expect(assigns(:volun_contact)).to be_persisted
      end

      it 'redirects to the created volun_contact' do
        post :create, volun_contact: valid_attributes
        expect(response).to redirect_to(volun_contacts_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved volun_contact as @volun_contact' do
        post :create, volun_contact: invalid_attributes
        expect(assigns(:volun_contact)).to be_a_new(Volun::Contact)
      end

      it 're-renders the "new" template' do
        post :create, volun_contact: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested volun_contact' do
        contact = Volun::Contact.create! valid_attributes
        put :update, id: contact.to_param, volun_contact: new_attributes
        contact.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested volun_contact as @volun_contact' do
        contact = Volun::Contact.create! valid_attributes
        put :update, id: contact.to_param, volun_contact: valid_attributes
        expect(assigns(:volun_contact)).to eq(contact)
      end

      it 'redirects to volun_contacts' do
        contact = Volun::Contact.create! valid_attributes
        put :update, id: contact.to_param, volun_contact: valid_attributes
        expect(response).to redirect_to(volun_contacts_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the volun_contact as @volun_contact' do
        contact = Volun::Contact.create! valid_attributes
        put :update, id: contact.to_param, volun_contact: invalid_attributes
        expect(assigns(:volun_contact)).to eq(contact)
      end

      it 're-renders the "edit" template' do
        contact = Volun::Contact.create! valid_attributes
        put :update, id: contact.to_param, volun_contact: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested volun_contact' do
      contact = Volun::Contact.create! valid_attributes
      expect {
        delete :destroy, id: contact.to_param
      }.to change(Volun::Contact, :count).by(contact.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the volun_contacts list' do
      contact = Volun::Contact.create! valid_attributes
      delete :destroy, id: contact.to_param
      expect(response).to redirect_to(volun_contacts_url)
    end
  end

end
