require 'rails_helper'

RSpec.describe Pt::PunctualsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :punctual
  }

  let(:invalid_attributes) {
    attributes_for :punctual, :invalid
  }

  describe "GET #index" do
    it 'assigns all pt_punctuals as @pt_punctuals' do
      punctual = Pt::Punctual.create! valid_attributes
      get :index
      expect(assigns(:pt_punctuals)).to eq([punctual])
    end
  end

  describe "GET #show" do
    it 'assigns the requested pt_punctual as @pt_punctual' do
      punctual = Pt::Punctual.create! valid_attributes
      get :show, id: punctual.to_param
      expect(assigns(:pt_punctual)).to eq(punctual)
    end
  end

  describe "GET #new" do
    it 'assigns a new pt_punctual as @pt_punctual' do
      get :new
      expect(assigns(:pt_punctual)).to be_a_new(Pt::Punctual)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested pt_punctual as @pt_punctual' do
      punctual = Pt::Punctual.create! valid_attributes
      get :edit, id: punctual.to_param
      expect(assigns(:pt_punctual)).to eq(punctual)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Pt::Punctual' do
        expect {
          post :create, pt_punctual: valid_attributes
        }.to change(Pt::Punctual, :count).by(1)
      end

      it 'assigns a newly created pt_punctual as @pt_punctual' do
        post :create, pt_punctual: valid_attributes
        expect(assigns(:pt_punctual)).to be_a(Pt::Punctual)
        expect(assigns(:pt_punctual)).to be_persisted
      end

      it 'redirects to the created pt_punctual' do
        post :create, pt_punctual: valid_attributes
        expect(response).to redirect_to(pt_punctuals_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved pt_punctual as @pt_punctual' do
        post :create, pt_punctual: invalid_attributes
        expect(assigns(:pt_punctual)).to be_a_new(Pt::Punctual)
      end

      it 're-renders the "new" template' do
        post :create, pt_punctual: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested pt_punctual' do
        punctual = Pt::Punctual.create! valid_attributes
        put :update, id: punctual.to_param, pt_punctual: new_attributes
        punctual.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested pt_punctual as @pt_punctual' do
        punctual = Pt::Punctual.create! valid_attributes
        put :update, id: punctual.to_param, pt_punctual: valid_attributes
        expect(assigns(:pt_punctual)).to eq(punctual)
      end

      it 'redirects to pt_punctuals' do
        punctual = Pt::Punctual.create! valid_attributes
        put :update, id: punctual.to_param, pt_punctual: valid_attributes
        expect(response).to redirect_to(pt_punctuals_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the pt_punctual as @pt_punctual' do
        punctual = Pt::Punctual.create! valid_attributes
        put :update, id: punctual.to_param, pt_punctual: invalid_attributes
        expect(assigns(:pt_punctual)).to eq(punctual)
      end

      it 're-renders the "edit" template' do
        punctual = Pt::Punctual.create! valid_attributes
        put :update, id: punctual.to_param, pt_punctual: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested pt_punctual' do
      punctual = Pt::Punctual.create! valid_attributes
      expect {
        delete :destroy, id: punctual.to_param
      }.to change(Pt::Punctual, :count).by(punctual.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the pt_punctuals list' do
      punctual = Pt::Punctual.create! valid_attributes
      delete :destroy, id: punctual.to_param
      expect(response).to redirect_to(pt_punctuals_url)
    end
  end

end
