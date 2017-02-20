require 'rails_helper'

RSpec.describe Pt::CentresController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :centre
  }

  let(:invalid_attributes) {
    attributes_for :centre, :invalid
  }

  describe "GET #index" do
    it 'assigns all pt_centres as @pt_centres' do
      centre = Pt::Centre.create! valid_attributes
      get :index
      expect(assigns(:pt_centres)).to eq([centre])
    end
  end

  describe "GET #show" do
    it 'assigns the requested pt_centre as @pt_centre' do
      centre = Pt::Centre.create! valid_attributes
      get :show, id: centre.to_param
      expect(assigns(:pt_centre)).to eq(centre)
    end
  end

  describe "GET #new" do
    it 'assigns a new pt_centre as @pt_centre' do
      get :new
      expect(assigns(:pt_centre)).to be_a_new(Pt::Centre)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested pt_centre as @pt_centre' do
      centre = Pt::Centre.create! valid_attributes
      get :edit, id: centre.to_param
      expect(assigns(:pt_centre)).to eq(centre)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Pt::Centre' do
        expect {
          post :create, pt_centre: valid_attributes
        }.to change(Pt::Centre, :count).by(1)
      end

      it 'assigns a newly created pt_centre as @pt_centre' do
        post :create, pt_centre: valid_attributes
        expect(assigns(:pt_centre)).to be_a(Pt::Centre)
        expect(assigns(:pt_centre)).to be_persisted
      end

      it 'redirects to the created pt_centre' do
        post :create, pt_centre: valid_attributes
        expect(response).to redirect_to(pt_centres_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved pt_centre as @pt_centre' do
        post :create, pt_centre: invalid_attributes
        expect(assigns(:pt_centre)).to be_a_new(Pt::Centre)
      end

      it 're-renders the "new" template' do
        post :create, pt_centre: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested pt_centre' do
        centre = Pt::Centre.create! valid_attributes
        put :update, id: centre.to_param, pt_centre: new_attributes
        centre.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested pt_centre as @pt_centre' do
        centre = Pt::Centre.create! valid_attributes
        put :update, id: centre.to_param, pt_centre: valid_attributes
        expect(assigns(:pt_centre)).to eq(centre)
      end

      it 'redirects to pt_centres' do
        centre = Pt::Centre.create! valid_attributes
        put :update, id: centre.to_param, pt_centre: valid_attributes
        expect(response).to redirect_to(pt_centres_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the pt_centre as @pt_centre' do
        centre = Pt::Centre.create! valid_attributes
        put :update, id: centre.to_param, pt_centre: invalid_attributes
        expect(assigns(:pt_centre)).to eq(centre)
      end

      it 're-renders the "edit" template' do
        centre = Pt::Centre.create! valid_attributes
        put :update, id: centre.to_param, pt_centre: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested pt_centre' do
      centre = Pt::Centre.create! valid_attributes
      expect {
        delete :destroy, id: centre.to_param
      }.to change(Pt::Centre, :count).by(centre.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the pt_centres list' do
      centre = Pt::Centre.create! valid_attributes
      delete :destroy, id: centre.to_param
      expect(response).to redirect_to(pt_centres_url)
    end
  end

end
