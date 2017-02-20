require 'rails_helper'

RSpec.describe Pt::SubventionsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :subvention
  }

  let(:invalid_attributes) {
    attributes_for :subvention, :invalid
  }

  describe "GET #index" do
    it 'assigns all pt_subventions as @pt_subventions' do
      subvention = Pt::Subvention.create! valid_attributes
      get :index
      expect(assigns(:pt_subventions)).to eq([subvention])
    end
  end

  describe "GET #show" do
    it 'assigns the requested pt_subvention as @pt_subvention' do
      subvention = Pt::Subvention.create! valid_attributes
      get :show, id: subvention.to_param
      expect(assigns(:pt_subvention)).to eq(subvention)
    end
  end

  describe "GET #new" do
    it 'assigns a new pt_subvention as @pt_subvention' do
      get :new
      expect(assigns(:pt_subvention)).to be_a_new(Pt::Subvention)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested pt_subvention as @pt_subvention' do
      subvention = Pt::Subvention.create! valid_attributes
      get :edit, id: subvention.to_param
      expect(assigns(:pt_subvention)).to eq(subvention)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Pt::Subvention' do
        expect {
          post :create, pt_subvention: valid_attributes
        }.to change(Pt::Subvention, :count).by(1)
      end

      it 'assigns a newly created pt_subvention as @pt_subvention' do
        post :create, pt_subvention: valid_attributes
        expect(assigns(:pt_subvention)).to be_a(Pt::Subvention)
        expect(assigns(:pt_subvention)).to be_persisted
      end

      it 'redirects to the created pt_subvention' do
        post :create, pt_subvention: valid_attributes
        expect(response).to redirect_to(pt_subventions_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved pt_subvention as @pt_subvention' do
        post :create, pt_subvention: invalid_attributes
        expect(assigns(:pt_subvention)).to be_a_new(Pt::Subvention)
      end

      it 're-renders the "new" template' do
        post :create, pt_subvention: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested pt_subvention' do
        subvention = Pt::Subvention.create! valid_attributes
        put :update, id: subvention.to_param, pt_subvention: new_attributes
        subvention.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested pt_subvention as @pt_subvention' do
        subvention = Pt::Subvention.create! valid_attributes
        put :update, id: subvention.to_param, pt_subvention: valid_attributes
        expect(assigns(:pt_subvention)).to eq(subvention)
      end

      it 'redirects to pt_subventions' do
        subvention = Pt::Subvention.create! valid_attributes
        put :update, id: subvention.to_param, pt_subvention: valid_attributes
        expect(response).to redirect_to(pt_subventions_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the pt_subvention as @pt_subvention' do
        subvention = Pt::Subvention.create! valid_attributes
        put :update, id: subvention.to_param, pt_subvention: invalid_attributes
        expect(assigns(:pt_subvention)).to eq(subvention)
      end

      it 're-renders the "edit" template' do
        subvention = Pt::Subvention.create! valid_attributes
        put :update, id: subvention.to_param, pt_subvention: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested pt_subvention' do
      subvention = Pt::Subvention.create! valid_attributes
      expect {
        delete :destroy, id: subvention.to_param
      }.to change(Pt::Subvention, :count).by(subvention.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the pt_subventions list' do
      subvention = Pt::Subvention.create! valid_attributes
      delete :destroy, id: subvention.to_param
      expect(response).to redirect_to(pt_subventions_url)
    end
  end

end
