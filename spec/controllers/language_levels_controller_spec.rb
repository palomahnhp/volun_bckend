require 'rails_helper'

RSpec.describe LanguageLevelsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :language_level
  }

  let(:invalid_attributes) {
    attributes_for :language_level, :invalid
  }

  describe "GET #index" do
    it 'assigns all language_levels as @language_levels' do
      language_level = LanguageLevel.create! valid_attributes
      get :index
      expect(assigns(:language_levels)).to eq([language_level])
    end
  end

  describe "GET #show" do
    it 'assigns the requested language_level as @language_level' do
      language_level = LanguageLevel.create! valid_attributes
      get :show, id: language_level.to_param
      expect(assigns(:language_level)).to eq(language_level)
    end
  end

  describe "GET #new" do
    it 'assigns a new language_level as @language_level' do
      get :new
      expect(assigns(:language_level)).to be_a_new(LanguageLevel)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested language_level as @language_level' do
      language_level = LanguageLevel.create! valid_attributes
      get :edit, id: language_level.to_param
      expect(assigns(:language_level)).to eq(language_level)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new LanguageLevel' do
        expect {
          post :create, language_level: valid_attributes
        }.to change(LanguageLevel, :count).by(1)
      end

      it 'assigns a newly created language_level as @language_level' do
        post :create, language_level: valid_attributes
        expect(assigns(:language_level)).to be_a(LanguageLevel)
        expect(assigns(:language_level)).to be_persisted
      end

      it 'redirects to the created language_level' do
        post :create, language_level: valid_attributes
        expect(response).to redirect_to(language_levels_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved language_level as @language_level' do
        post :create, language_level: invalid_attributes
        expect(assigns(:language_level)).to be_a_new(LanguageLevel)
      end

      it 're-renders the "new" template' do
        post :create, language_level: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested language_level' do
        language_level = LanguageLevel.create! valid_attributes
        put :update, id: language_level.to_param, language_level: new_attributes
        language_level.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested language_level as @language_level' do
        language_level = LanguageLevel.create! valid_attributes
        put :update, id: language_level.to_param, language_level: valid_attributes
        expect(assigns(:language_level)).to eq(language_level)
      end

      it 'redirects to language_levels' do
        language_level = LanguageLevel.create! valid_attributes
        put :update, id: language_level.to_param, language_level: valid_attributes
        expect(response).to redirect_to(language_levels_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the language_level as @language_level' do
        language_level = LanguageLevel.create! valid_attributes
        put :update, id: language_level.to_param, language_level: invalid_attributes
        expect(assigns(:language_level)).to eq(language_level)
      end

      it 're-renders the "edit" template' do
        language_level = LanguageLevel.create! valid_attributes
        put :update, id: language_level.to_param, language_level: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested language_level' do
      language_level = LanguageLevel.create! valid_attributes
      expect {
        delete :destroy, id: language_level.to_param
      }.to change(LanguageLevel, :count).by(language_level.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the language_levels list' do
      language_level = LanguageLevel.create! valid_attributes
      delete :destroy, id: language_level.to_param
      expect(response).to redirect_to(language_levels_url)
    end
  end

end
