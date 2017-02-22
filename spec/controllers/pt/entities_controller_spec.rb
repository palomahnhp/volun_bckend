require 'rails_helper'

RSpec.describe Pt::EntitiesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :entity
  }

  let(:invalid_attributes) {
    attributes_for :entity, :invalid
  }

  describe "GET #index" do
    it 'assigns all pt_entities as @pt_entities' do
      entity = Pt::Entity.create! valid_attributes
      get :index
      expect(assigns(:pt_entities)).to eq([entity])
    end
  end

  describe "GET #show" do
    it 'assigns the requested pt_entity as @pt_entity' do
      entity = Pt::Entity.create! valid_attributes
      get :show, id: entity.to_param
      expect(assigns(:pt_entity)).to eq(entity)
    end
  end

  describe "GET #new" do
    it 'assigns a new pt_entity as @pt_entity' do
      get :new
      expect(assigns(:pt_entity)).to be_a_new(Pt::Entity)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested pt_entity as @pt_entity' do
      entity = Pt::Entity.create! valid_attributes
      get :edit, id: entity.to_param
      expect(assigns(:pt_entity)).to eq(entity)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Pt::Entity' do
        expect {
          post :create, pt_entity: valid_attributes
        }.to change(Pt::Entity, :count).by(1)
      end

      it 'assigns a newly created pt_entity as @pt_entity' do
        post :create, pt_entity: valid_attributes
        expect(assigns(:pt_entity)).to be_a(Pt::Entity)
        expect(assigns(:pt_entity)).to be_persisted
      end

      it 'redirects to the created pt_entity' do
        post :create, pt_entity: valid_attributes
        expect(response).to redirect_to(pt_entities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved pt_entity as @pt_entity' do
        post :create, pt_entity: invalid_attributes
        expect(assigns(:pt_entity)).to be_a_new(Pt::Entity)
      end

      it 're-renders the "new" template' do
        post :create, pt_entity: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested pt_entity' do
        entity = Pt::Entity.create! valid_attributes
        put :update, id: entity.to_param, pt_entity: new_attributes
        entity.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested pt_entity as @pt_entity' do
        entity = Pt::Entity.create! valid_attributes
        put :update, id: entity.to_param, pt_entity: valid_attributes
        expect(assigns(:pt_entity)).to eq(entity)
      end

      it 'redirects to pt_entities' do
        entity = Pt::Entity.create! valid_attributes
        put :update, id: entity.to_param, pt_entity: valid_attributes
        expect(response).to redirect_to(pt_entities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the pt_entity as @pt_entity' do
        entity = Pt::Entity.create! valid_attributes
        put :update, id: entity.to_param, pt_entity: invalid_attributes
        expect(assigns(:pt_entity)).to eq(entity)
      end

      it 're-renders the "edit" template' do
        entity = Pt::Entity.create! valid_attributes
        put :update, id: entity.to_param, pt_entity: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested pt_entity' do
      entity = Pt::Entity.create! valid_attributes
      expect {
        delete :destroy, id: entity.to_param
      }.to change(Pt::Entity, :count).by(entity.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the pt_entities list' do
      entity = Pt::Entity.create! valid_attributes
      delete :destroy, id: entity.to_param
      expect(response).to redirect_to(pt_entities_url)
    end
  end

end
