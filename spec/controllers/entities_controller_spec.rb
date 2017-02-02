require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
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
    it 'assigns all entities as @entities' do
      entity = Entity.create! valid_attributes
      get :index
      expect(assigns(:entities)).to eq([entity])
    end
  end

  describe "GET #show" do
    it 'assigns the requested entity as @entity' do
      entity = Entity.create! valid_attributes
      get :show, id: entity.to_param
      expect(assigns(:entity)).to eq(entity)
    end
  end

  describe "GET #new" do
    it 'assigns a new entity as @entity' do
      get :new
      expect(assigns(:entity)).to be_a_new(Entity)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested entity as @entity' do
      entity = Entity.create! valid_attributes
      get :edit, id: entity.to_param
      expect(assigns(:entity)).to eq(entity)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Entity' do
        expect {
          post :create, entity: valid_attributes
        }.to change(Entity, :count).by(1)
      end

      it 'assigns a newly created entity as @entity' do
        post :create, entity: valid_attributes
        expect(assigns(:entity)).to be_a(Entity)
        expect(assigns(:entity)).to be_persisted
      end

      it 'redirects to the created entity' do
        post :create, entity: valid_attributes
        expect(response).to redirect_to(entities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved entity as @entity' do
        post :create, entity: invalid_attributes
        expect(assigns(:entity)).to be_a_new(Entity)
      end

      it 're-renders the "new" template' do
        post :create, entity: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested entity' do
        entity = Entity.create! valid_attributes
        put :update, id: entity.to_param, entity: new_attributes
        entity.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested entity as @entity' do
        entity = Entity.create! valid_attributes
        put :update, id: entity.to_param, entity: valid_attributes
        expect(assigns(:entity)).to eq(entity)
      end

      it 'redirects to entities' do
        entity = Entity.create! valid_attributes
        put :update, id: entity.to_param, entity: valid_attributes
        expect(response).to redirect_to(entities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the entity as @entity' do
        entity = Entity.create! valid_attributes
        put :update, id: entity.to_param, entity: invalid_attributes
        expect(assigns(:entity)).to eq(entity)
      end

      it 're-renders the "edit" template' do
        entity = Entity.create! valid_attributes
        put :update, id: entity.to_param, entity: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested entity' do
      entity = Entity.create! valid_attributes
      expect {
        delete :destroy, id: entity.to_param
      }.to change(Entity, :count).by(entity.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the entities list' do
      entity = Entity.create! valid_attributes
      delete :destroy, id: entity.to_param
      expect(response).to redirect_to(entities_url)
    end
  end

end
