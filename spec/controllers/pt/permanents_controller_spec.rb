require 'rails_helper'

RSpec.describe Pt::PermanentsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :permanent
  }

  let(:invalid_attributes) {
    attributes_for :permanent, :invalid
  }

  describe "GET #index" do
    it 'assigns all pt_permanents as @pt_permanents' do
      permanent = Pt::Permanent.create! valid_attributes
      get :index
      expect(assigns(:pt_permanents)).to eq([permanent])
    end
  end

  describe "GET #show" do
    it 'assigns the requested pt_permanent as @pt_permanent' do
      permanent = Pt::Permanent.create! valid_attributes
      get :show, id: permanent.to_param
      expect(assigns(:pt_permanent)).to eq(permanent)
    end
  end

  describe "GET #new" do
    it 'assigns a new pt_permanent as @pt_permanent' do
      get :new
      expect(assigns(:pt_permanent)).to be_a_new(Pt::Permanent)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested pt_permanent as @pt_permanent' do
      permanent = Pt::Permanent.create! valid_attributes
      get :edit, id: permanent.to_param
      expect(assigns(:pt_permanent)).to eq(permanent)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Pt::Permanent' do
        expect {
          post :create, pt_permanent: valid_attributes
        }.to change(Pt::Permanent, :count).by(1)
      end

      it 'assigns a newly created pt_permanent as @pt_permanent' do
        post :create, pt_permanent: valid_attributes
        expect(assigns(:pt_permanent)).to be_a(Pt::Permanent)
        expect(assigns(:pt_permanent)).to be_persisted
      end

      it 'redirects to the created pt_permanent' do
        post :create, pt_permanent: valid_attributes
        expect(response).to redirect_to(pt_permanents_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved pt_permanent as @pt_permanent' do
        post :create, pt_permanent: invalid_attributes
        expect(assigns(:pt_permanent)).to be_a_new(Pt::Permanent)
      end

      it 're-renders the "new" template' do
        post :create, pt_permanent: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested pt_permanent' do
        permanent = Pt::Permanent.create! valid_attributes
        put :update, id: permanent.to_param, pt_permanent: new_attributes
        permanent.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested pt_permanent as @pt_permanent' do
        permanent = Pt::Permanent.create! valid_attributes
        put :update, id: permanent.to_param, pt_permanent: valid_attributes
        expect(assigns(:pt_permanent)).to eq(permanent)
      end

      it 'redirects to pt_permanents' do
        permanent = Pt::Permanent.create! valid_attributes
        put :update, id: permanent.to_param, pt_permanent: valid_attributes
        expect(response).to redirect_to(pt_permanents_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the pt_permanent as @pt_permanent' do
        permanent = Pt::Permanent.create! valid_attributes
        put :update, id: permanent.to_param, pt_permanent: invalid_attributes
        expect(assigns(:pt_permanent)).to eq(permanent)
      end

      it 're-renders the "edit" template' do
        permanent = Pt::Permanent.create! valid_attributes
        put :update, id: permanent.to_param, pt_permanent: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested pt_permanent' do
      permanent = Pt::Permanent.create! valid_attributes
      expect {
        delete :destroy, id: permanent.to_param
      }.to change(Pt::Permanent, :count).by(permanent.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the pt_permanents list' do
      permanent = Pt::Permanent.create! valid_attributes
      delete :destroy, id: permanent.to_param
      expect(response).to redirect_to(pt_permanents_url)
    end
  end

end
