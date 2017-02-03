require 'rails_helper'

RSpec.describe Pt::OthersController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :other
  }

  let(:invalid_attributes) {
    attributes_for :other, :invalid
  }

  describe "GET #index" do
    it 'assigns all pt_others as @pt_others' do
      other = Pt::Other.create! valid_attributes
      get :index
      expect(assigns(:pt_others)).to eq([other])
    end
  end

  describe "GET #show" do
    it 'assigns the requested pt_other as @pt_other' do
      other = Pt::Other.create! valid_attributes
      get :show, id: other.to_param
      expect(assigns(:pt_other)).to eq(other)
    end
  end

  describe "GET #new" do
    it 'assigns a new pt_other as @pt_other' do
      get :new
      expect(assigns(:pt_other)).to be_a_new(Pt::Other)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested pt_other as @pt_other' do
      other = Pt::Other.create! valid_attributes
      get :edit, id: other.to_param
      expect(assigns(:pt_other)).to eq(other)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Pt::Other' do
        expect {
          post :create, pt_other: valid_attributes
        }.to change(Pt::Other, :count).by(1)
      end

      it 'assigns a newly created pt_other as @pt_other' do
        post :create, pt_other: valid_attributes
        expect(assigns(:pt_other)).to be_a(Pt::Other)
        expect(assigns(:pt_other)).to be_persisted
      end

      it 'redirects to the created pt_other' do
        post :create, pt_other: valid_attributes
        expect(response).to redirect_to(pt_others_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved pt_other as @pt_other' do
        post :create, pt_other: invalid_attributes
        expect(assigns(:pt_other)).to be_a_new(Pt::Other)
      end

      it 're-renders the "new" template' do
        post :create, pt_other: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested pt_other' do
        other = Pt::Other.create! valid_attributes
        put :update, id: other.to_param, pt_other: new_attributes
        other.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested pt_other as @pt_other' do
        other = Pt::Other.create! valid_attributes
        put :update, id: other.to_param, pt_other: valid_attributes
        expect(assigns(:pt_other)).to eq(other)
      end

      it 'redirects to pt_others' do
        other = Pt::Other.create! valid_attributes
        put :update, id: other.to_param, pt_other: valid_attributes
        expect(response).to redirect_to(pt_others_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the pt_other as @pt_other' do
        other = Pt::Other.create! valid_attributes
        put :update, id: other.to_param, pt_other: invalid_attributes
        expect(assigns(:pt_other)).to eq(other)
      end

      it 're-renders the "edit" template' do
        other = Pt::Other.create! valid_attributes
        put :update, id: other.to_param, pt_other: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested pt_other' do
      other = Pt::Other.create! valid_attributes
      expect {
        delete :destroy, id: other.to_param
      }.to change(Pt::Other, :count).by(other.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the pt_others list' do
      other = Pt::Other.create! valid_attributes
      delete :destroy, id: other.to_param
      expect(response).to redirect_to(pt_others_url)
    end
  end

end
