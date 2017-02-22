require 'rails_helper'

RSpec.describe ContactResultsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :contact_result
  }

  let(:invalid_attributes) {
    attributes_for :contact_result, :invalid
  }

  describe "GET #index" do
    it 'assigns all contact_results as @contact_results' do
      contact_result = ContactResult.create! valid_attributes
      get :index
      expect(assigns(:contact_results)).to eq([contact_result])
    end
  end

  describe "GET #show" do
    it 'assigns the requested contact_result as @contact_result' do
      contact_result = ContactResult.create! valid_attributes
      get :show, id: contact_result.to_param
      expect(assigns(:contact_result)).to eq(contact_result)
    end
  end

  describe "GET #new" do
    it 'assigns a new contact_result as @contact_result' do
      get :new
      expect(assigns(:contact_result)).to be_a_new(ContactResult)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested contact_result as @contact_result' do
      contact_result = ContactResult.create! valid_attributes
      get :edit, id: contact_result.to_param
      expect(assigns(:contact_result)).to eq(contact_result)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new ContactResult' do
        expect {
          post :create, contact_result: valid_attributes
        }.to change(ContactResult, :count).by(1)
      end

      it 'assigns a newly created contact_result as @contact_result' do
        post :create, contact_result: valid_attributes
        expect(assigns(:contact_result)).to be_a(ContactResult)
        expect(assigns(:contact_result)).to be_persisted
      end

      it 'redirects to the created contact_result' do
        post :create, contact_result: valid_attributes
        expect(response).to redirect_to(contact_results_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved contact_result as @contact_result' do
        post :create, contact_result: invalid_attributes
        expect(assigns(:contact_result)).to be_a_new(ContactResult)
      end

      it 're-renders the "new" template' do
        post :create, contact_result: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested contact_result' do
        contact_result = ContactResult.create! valid_attributes
        put :update, id: contact_result.to_param, contact_result: new_attributes
        contact_result.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested contact_result as @contact_result' do
        contact_result = ContactResult.create! valid_attributes
        put :update, id: contact_result.to_param, contact_result: valid_attributes
        expect(assigns(:contact_result)).to eq(contact_result)
      end

      it 'redirects to contact_results' do
        contact_result = ContactResult.create! valid_attributes
        put :update, id: contact_result.to_param, contact_result: valid_attributes
        expect(response).to redirect_to(contact_results_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the contact_result as @contact_result' do
        contact_result = ContactResult.create! valid_attributes
        put :update, id: contact_result.to_param, contact_result: invalid_attributes
        expect(assigns(:contact_result)).to eq(contact_result)
      end

      it 're-renders the "edit" template' do
        contact_result = ContactResult.create! valid_attributes
        put :update, id: contact_result.to_param, contact_result: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested contact_result' do
      contact_result = ContactResult.create! valid_attributes
      expect {
        delete :destroy, id: contact_result.to_param
      }.to change(ContactResult, :count).by(contact_result.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the contact_results list' do
      contact_result = ContactResult.create! valid_attributes
      delete :destroy, id: contact_result.to_param
      expect(response).to redirect_to(contact_results_url)
    end
  end

end
