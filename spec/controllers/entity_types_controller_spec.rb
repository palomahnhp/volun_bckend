require 'rails_helper'

RSpec.describe EntityTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :entity_type
  }

  let(:invalid_attributes) {
    attributes_for :entity_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all entity_types as @entity_types' do
      entity_type = EntityType.create! valid_attributes
      get :index
      expect(assigns(:entity_types)).to eq([entity_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested entity_type as @entity_type' do
      entity_type = EntityType.create! valid_attributes
      get :show, id: entity_type.to_param
      expect(assigns(:entity_type)).to eq(entity_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new entity_type as @entity_type' do
      get :new
      expect(assigns(:entity_type)).to be_a_new(EntityType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested entity_type as @entity_type' do
      entity_type = EntityType.create! valid_attributes
      get :edit, id: entity_type.to_param
      expect(assigns(:entity_type)).to eq(entity_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new EntityType' do
        expect {
          post :create, entity_type: valid_attributes
        }.to change(EntityType, :count).by(1)
      end

      it 'assigns a newly created entity_type as @entity_type' do
        post :create, entity_type: valid_attributes
        expect(assigns(:entity_type)).to be_a(EntityType)
        expect(assigns(:entity_type)).to be_persisted
      end

      it 'redirects to the created entity_type' do
        post :create, entity_type: valid_attributes
        expect(response).to redirect_to(entity_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved entity_type as @entity_type' do
        post :create, entity_type: invalid_attributes
        expect(assigns(:entity_type)).to be_a_new(EntityType)
      end

      it 're-renders the "new" template' do
        post :create, entity_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested entity_type' do
        entity_type = EntityType.create! valid_attributes
        put :update, id: entity_type.to_param, entity_type: new_attributes
        entity_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested entity_type as @entity_type' do
        entity_type = EntityType.create! valid_attributes
        put :update, id: entity_type.to_param, entity_type: valid_attributes
        expect(assigns(:entity_type)).to eq(entity_type)
      end

      it 'redirects to entity_types' do
        entity_type = EntityType.create! valid_attributes
        put :update, id: entity_type.to_param, entity_type: valid_attributes
        expect(response).to redirect_to(entity_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the entity_type as @entity_type' do
        entity_type = EntityType.create! valid_attributes
        put :update, id: entity_type.to_param, entity_type: invalid_attributes
        expect(assigns(:entity_type)).to eq(entity_type)
      end

      it 're-renders the "edit" template' do
        entity_type = EntityType.create! valid_attributes
        put :update, id: entity_type.to_param, entity_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested entity_type' do
      entity_type = EntityType.create! valid_attributes
      expect {
        delete :destroy, id: entity_type.to_param
      }.to change(EntityType, :count).by(entity_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the entity_types list' do
      entity_type = EntityType.create! valid_attributes
      delete :destroy, id: entity_type.to_param
      expect(response).to redirect_to(entity_types_url)
    end
  end

end
