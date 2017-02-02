require 'rails_helper'

RSpec.describe IdNumberTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :id_number_type
  }

  let(:invalid_attributes) {
    attributes_for :id_number_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all id_number_types as @id_number_types' do
      id_number_type = IdNumberType.create! valid_attributes
      get :index
      expect(assigns(:id_number_types)).to eq([id_number_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested id_number_type as @id_number_type' do
      id_number_type = IdNumberType.create! valid_attributes
      get :show, id: id_number_type.to_param
      expect(assigns(:id_number_type)).to eq(id_number_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new id_number_type as @id_number_type' do
      get :new
      expect(assigns(:id_number_type)).to be_a_new(IdNumberType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested id_number_type as @id_number_type' do
      id_number_type = IdNumberType.create! valid_attributes
      get :edit, id: id_number_type.to_param
      expect(assigns(:id_number_type)).to eq(id_number_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new IdNumberType' do
        expect {
          post :create, id_number_type: valid_attributes
        }.to change(IdNumberType, :count).by(1)
      end

      it 'assigns a newly created id_number_type as @id_number_type' do
        post :create, id_number_type: valid_attributes
        expect(assigns(:id_number_type)).to be_a(IdNumberType)
        expect(assigns(:id_number_type)).to be_persisted
      end

      it 'redirects to the created id_number_type' do
        post :create, id_number_type: valid_attributes
        expect(response).to redirect_to(id_number_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved id_number_type as @id_number_type' do
        post :create, id_number_type: invalid_attributes
        expect(assigns(:id_number_type)).to be_a_new(IdNumberType)
      end

      it 're-renders the "new" template' do
        post :create, id_number_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested id_number_type' do
        id_number_type = IdNumberType.create! valid_attributes
        put :update, id: id_number_type.to_param, id_number_type: new_attributes
        id_number_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested id_number_type as @id_number_type' do
        id_number_type = IdNumberType.create! valid_attributes
        put :update, id: id_number_type.to_param, id_number_type: valid_attributes
        expect(assigns(:id_number_type)).to eq(id_number_type)
      end

      it 'redirects to id_number_types' do
        id_number_type = IdNumberType.create! valid_attributes
        put :update, id: id_number_type.to_param, id_number_type: valid_attributes
        expect(response).to redirect_to(id_number_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the id_number_type as @id_number_type' do
        id_number_type = IdNumberType.create! valid_attributes
        put :update, id: id_number_type.to_param, id_number_type: invalid_attributes
        expect(assigns(:id_number_type)).to eq(id_number_type)
      end

      it 're-renders the "edit" template' do
        id_number_type = IdNumberType.create! valid_attributes
        put :update, id: id_number_type.to_param, id_number_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested id_number_type' do
      id_number_type = IdNumberType.create! valid_attributes
      expect {
        delete :destroy, id: id_number_type.to_param
      }.to change(IdNumberType, :count).by(id_number_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the id_number_types list' do
      id_number_type = IdNumberType.create! valid_attributes
      delete :destroy, id: id_number_type.to_param
      expect(response).to redirect_to(id_number_types_url)
    end
  end

end
