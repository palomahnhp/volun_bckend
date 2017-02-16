require 'rails_helper'

RSpec.describe LanguagesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :language
  }

  let(:invalid_attributes) {
    attributes_for :language, :invalid
  }

  describe "GET #index" do
    it 'assigns all languages as @languages' do
      language = Language.create! valid_attributes
      get :index
      expect(assigns(:languages)).to eq([language])
    end
  end

  describe "GET #show" do
    it 'assigns the requested language as @language' do
      language = Language.create! valid_attributes
      get :show, id: language.to_param
      expect(assigns(:language)).to eq(language)
    end
  end

  describe "GET #new" do
    it 'assigns a new language as @language' do
      get :new
      expect(assigns(:language)).to be_a_new(Language)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested language as @language' do
      language = Language.create! valid_attributes
      get :edit, id: language.to_param
      expect(assigns(:language)).to eq(language)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Language' do
        expect {
          post :create, language: valid_attributes
        }.to change(Language, :count).by(1)
      end

      it 'assigns a newly created language as @language' do
        post :create, language: valid_attributes
        expect(assigns(:language)).to be_a(Language)
        expect(assigns(:language)).to be_persisted
      end

      it 'redirects to the created language' do
        post :create, language: valid_attributes
        expect(response).to redirect_to(languages_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved language as @language' do
        post :create, language: invalid_attributes
        expect(assigns(:language)).to be_a_new(Language)
      end

      it 're-renders the "new" template' do
        post :create, language: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested language' do
        language = Language.create! valid_attributes
        put :update, id: language.to_param, language: new_attributes
        language.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested language as @language' do
        language = Language.create! valid_attributes
        put :update, id: language.to_param, language: valid_attributes
        expect(assigns(:language)).to eq(language)
      end

      it 'redirects to languages' do
        language = Language.create! valid_attributes
        put :update, id: language.to_param, language: valid_attributes
        expect(response).to redirect_to(languages_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the language as @language' do
        language = Language.create! valid_attributes
        put :update, id: language.to_param, language: invalid_attributes
        expect(assigns(:language)).to eq(language)
      end

      it 're-renders the "edit" template' do
        language = Language.create! valid_attributes
        put :update, id: language.to_param, language: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested language' do
      language = Language.create! valid_attributes
      expect {
        delete :destroy, id: language.to_param
      }.to change(Language, :count).by(language.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the languages list' do
      language = Language.create! valid_attributes
      delete :destroy, id: language.to_param
      expect(response).to redirect_to(languages_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested language' do
      language = Language.create! valid_attributes
      delete :destroy, id: language.to_param
      post :recover, id: language.to_param
      expect(language.active).to eq(true)
    end

    it 'redirects to the languages list' do
      language = Language.create! valid_attributes
      post :recover, id: language.to_param
      expect(response).to redirect_to(languages_url)
    end
  end

end
