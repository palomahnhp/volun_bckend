require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :document
  }

  let(:invalid_attributes) {
    attributes_for :document, :invalid
  }

  describe "GET #index" do
    it 'assigns all documents as @documents' do
      document = Document.create! valid_attributes
      get :index
      expect(assigns(:documents)).to eq([document])
    end
  end

  describe "GET #show" do
    it 'assigns the requested document as @document' do
      document = Document.create! valid_attributes
      get :show, id: document.to_param
      expect(assigns(:document)).to eq(document)
    end
  end

  describe "GET #new" do
    it 'assigns a new document as @document' do
      get :new
      expect(assigns(:document)).to be_a_new(Document)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested document as @document' do
      document = Document.create! valid_attributes
      get :edit, id: document.to_param
      expect(assigns(:document)).to eq(document)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Document' do
        expect {
          post :create, document: valid_attributes
        }.to change(Document, :count).by(1)
      end

      it 'assigns a newly created document as @document' do
        post :create, document: valid_attributes
        expect(assigns(:document)).to be_a(Document)
        expect(assigns(:document)).to be_persisted
      end

      it 'redirects to the created document' do
        post :create, document: valid_attributes
        expect(response).to redirect_to(documents_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved document as @document' do
        post :create, document: invalid_attributes
        expect(assigns(:document)).to be_a_new(Document)
      end

      it 're-renders the "new" template' do
        post :create, document: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested document' do
        document = Document.create! valid_attributes
        put :update, id: document.to_param, document: new_attributes
        document.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested document as @document' do
        document = Document.create! valid_attributes
        put :update, id: document.to_param, document: valid_attributes
        expect(assigns(:document)).to eq(document)
      end

      it 'redirects to documents' do
        document = Document.create! valid_attributes
        put :update, id: document.to_param, document: valid_attributes
        expect(response).to redirect_to(documents_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the document as @document' do
        document = Document.create! valid_attributes
        put :update, id: document.to_param, document: invalid_attributes
        expect(assigns(:document)).to eq(document)
      end

      it 're-renders the "edit" template' do
        document = Document.create! valid_attributes
        put :update, id: document.to_param, document: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested document' do
      document = Document.create! valid_attributes
      expect {
        delete :destroy, id: document.to_param
      }.to change(Document, :count).by(document.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the documents list' do
      document = Document.create! valid_attributes
      delete :destroy, id: document.to_param
      expect(response).to redirect_to(documents_url)
    end
  end

end
