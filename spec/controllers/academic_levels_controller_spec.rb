require 'rails_helper'

RSpec.describe AcademicLevelsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :academic_level
  }

  let(:invalid_attributes) {
    attributes_for :academic_level, :invalid
  }

  describe "GET #index" do
    it 'assigns all academic_levels as @academic_levels' do
      academic_level = AcademicLevel.create! valid_attributes
      get :index
      expect(assigns(:academic_levels)).to eq([academic_level])
    end
  end

  describe "GET #show" do
    it 'assigns the requested academic_level as @academic_level' do
      academic_level = AcademicLevel.create! valid_attributes
      get :show, id: academic_level.to_param
      expect(assigns(:academic_level)).to eq(academic_level)
    end
  end

  describe "GET #new" do
    it 'assigns a new academic_level as @academic_level' do
      get :new
      expect(assigns(:academic_level)).to be_a_new(AcademicLevel)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested academic_level as @academic_level' do
      academic_level = AcademicLevel.create! valid_attributes
      get :edit, id: academic_level.to_param
      expect(assigns(:academic_level)).to eq(academic_level)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new AcademicLevel' do
        expect {
          post :create, academic_level: valid_attributes
        }.to change(AcademicLevel, :count).by(1)
      end

      it 'assigns a newly created academic_level as @academic_level' do
        post :create, academic_level: valid_attributes
        expect(assigns(:academic_level)).to be_a(AcademicLevel)
        expect(assigns(:academic_level)).to be_persisted
      end

      it 'redirects to the created academic_level' do
        post :create, academic_level: valid_attributes
        expect(response).to redirect_to(academic_levels_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved academic_level as @academic_level' do
        post :create, academic_level: invalid_attributes
        expect(assigns(:academic_level)).to be_a_new(AcademicLevel)
      end

      it 're-renders the "new" template' do
        post :create, academic_level: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested academic_level' do
        academic_level = AcademicLevel.create! valid_attributes
        put :update, id: academic_level.to_param, academic_level: new_attributes
        academic_level.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested academic_level as @academic_level' do
        academic_level = AcademicLevel.create! valid_attributes
        put :update, id: academic_level.to_param, academic_level: valid_attributes
        expect(assigns(:academic_level)).to eq(academic_level)
      end

      it 'redirects to academic_levels' do
        academic_level = AcademicLevel.create! valid_attributes
        put :update, id: academic_level.to_param, academic_level: valid_attributes
        expect(response).to redirect_to(academic_levels_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the academic_level as @academic_level' do
        academic_level = AcademicLevel.create! valid_attributes
        put :update, id: academic_level.to_param, academic_level: invalid_attributes
        expect(assigns(:academic_level)).to eq(academic_level)
      end

      it 're-renders the "edit" template' do
        academic_level = AcademicLevel.create! valid_attributes
        put :update, id: academic_level.to_param, academic_level: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested academic_level' do
      academic_level = AcademicLevel.create! valid_attributes
      expect {
        delete :destroy, id: academic_level.to_param
      }.to change(AcademicLevel, :count).by(academic_level.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the academic_levels list' do
      academic_level = AcademicLevel.create! valid_attributes
      delete :destroy, id: academic_level.to_param
      expect(response).to redirect_to(academic_levels_url)
    end
  end

end
