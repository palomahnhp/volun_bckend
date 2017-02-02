require 'rails_helper'

RSpec.describe TraitsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :trait
  }

  let(:invalid_attributes) {
    attributes_for :trait, :invalid
  }

  describe "GET #index" do
    it 'assigns all traits as @traits' do
      trait = Trait.create! valid_attributes
      get :index
      expect(assigns(:traits)).to eq([trait])
    end
  end

  describe "GET #show" do
    it 'assigns the requested trait as @trait' do
      trait = Trait.create! valid_attributes
      get :show, id: trait.to_param
      expect(assigns(:trait)).to eq(trait)
    end
  end

  describe "GET #new" do
    it 'assigns a new trait as @trait' do
      get :new
      expect(assigns(:trait)).to be_a_new(Trait)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested trait as @trait' do
      trait = Trait.create! valid_attributes
      get :edit, id: trait.to_param
      expect(assigns(:trait)).to eq(trait)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Trait' do
        expect {
          post :create, trait: valid_attributes
        }.to change(Trait, :count).by(1)
      end

      it 'assigns a newly created trait as @trait' do
        post :create, trait: valid_attributes
        expect(assigns(:trait)).to be_a(Trait)
        expect(assigns(:trait)).to be_persisted
      end

      it 'redirects to the created trait' do
        post :create, trait: valid_attributes
        expect(response).to redirect_to(traits_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved trait as @trait' do
        post :create, trait: invalid_attributes
        expect(assigns(:trait)).to be_a_new(Trait)
      end

      it 're-renders the "new" template' do
        post :create, trait: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested trait' do
        trait = Trait.create! valid_attributes
        put :update, id: trait.to_param, trait: new_attributes
        trait.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested trait as @trait' do
        trait = Trait.create! valid_attributes
        put :update, id: trait.to_param, trait: valid_attributes
        expect(assigns(:trait)).to eq(trait)
      end

      it 'redirects to traits' do
        trait = Trait.create! valid_attributes
        put :update, id: trait.to_param, trait: valid_attributes
        expect(response).to redirect_to(traits_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the trait as @trait' do
        trait = Trait.create! valid_attributes
        put :update, id: trait.to_param, trait: invalid_attributes
        expect(assigns(:trait)).to eq(trait)
      end

      it 're-renders the "edit" template' do
        trait = Trait.create! valid_attributes
        put :update, id: trait.to_param, trait: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested trait' do
      trait = Trait.create! valid_attributes
      expect {
        delete :destroy, id: trait.to_param
      }.to change(Trait, :count).by(trait.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the traits list' do
      trait = Trait.create! valid_attributes
      delete :destroy, id: trait.to_param
      expect(response).to redirect_to(traits_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested trait' do
      trait = Trait.create! valid_attributes
      delete :destroy, id: trait.to_param
      post :recover, id: trait.to_param
      expect(trait.active).to eq(true)
    end

    it 'redirects to the traits list' do
      trait = Trait.create! valid_attributes
      post :recover, id: trait.to_param
      expect(response).to redirect_to(traits_url)
    end
  end

end
