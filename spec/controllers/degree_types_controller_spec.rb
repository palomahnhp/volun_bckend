require 'rails_helper'

RSpec.describe DegreeTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :degree_type
  }

  let(:invalid_attributes) {
    attributes_for :degree_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all degree_types as @degree_types' do
      degree_type = DegreeType.create! valid_attributes
      get :index
      expect(assigns(:degree_types)).to eq([degree_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested degree_type as @degree_type' do
      degree_type = DegreeType.create! valid_attributes
      get :show, id: degree_type.to_param
      expect(assigns(:degree_type)).to eq(degree_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new degree_type as @degree_type' do
      get :new
      expect(assigns(:degree_type)).to be_a_new(DegreeType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested degree_type as @degree_type' do
      degree_type = DegreeType.create! valid_attributes
      get :edit, id: degree_type.to_param
      expect(assigns(:degree_type)).to eq(degree_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new DegreeType' do
        expect {
          post :create, degree_type: valid_attributes
        }.to change(DegreeType, :count).by(1)
      end

      it 'assigns a newly created degree_type as @degree_type' do
        post :create, degree_type: valid_attributes
        expect(assigns(:degree_type)).to be_a(DegreeType)
        expect(assigns(:degree_type)).to be_persisted
      end

      it 'redirects to the created degree_type' do
        post :create, degree_type: valid_attributes
        expect(response).to redirect_to(degree_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved degree_type as @degree_type' do
        post :create, degree_type: invalid_attributes
        expect(assigns(:degree_type)).to be_a_new(DegreeType)
      end

      it 're-renders the "new" template' do
        post :create, degree_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested degree_type' do
        degree_type = DegreeType.create! valid_attributes
        put :update, id: degree_type.to_param, degree_type: new_attributes
        degree_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested degree_type as @degree_type' do
        degree_type = DegreeType.create! valid_attributes
        put :update, id: degree_type.to_param, degree_type: valid_attributes
        expect(assigns(:degree_type)).to eq(degree_type)
      end

      it 'redirects to degree_types' do
        degree_type = DegreeType.create! valid_attributes
        put :update, id: degree_type.to_param, degree_type: valid_attributes
        expect(response).to redirect_to(degree_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the degree_type as @degree_type' do
        degree_type = DegreeType.create! valid_attributes
        put :update, id: degree_type.to_param, degree_type: invalid_attributes
        expect(assigns(:degree_type)).to eq(degree_type)
      end

      it 're-renders the "edit" template' do
        degree_type = DegreeType.create! valid_attributes
        put :update, id: degree_type.to_param, degree_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested degree_type' do
      degree_type = DegreeType.create! valid_attributes
      expect {
        delete :destroy, id: degree_type.to_param
      }.to change(DegreeType, :count).by(degree_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the degree_types list' do
      degree_type = DegreeType.create! valid_attributes
      delete :destroy, id: degree_type.to_param
      expect(response).to redirect_to(degree_types_url)
    end
  end

end
