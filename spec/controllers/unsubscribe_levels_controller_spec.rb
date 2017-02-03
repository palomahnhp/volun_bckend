require 'rails_helper'

RSpec.describe UnsubscribeLevelsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :unsubscribe_level
  }

  let(:invalid_attributes) {
    attributes_for :unsubscribe_level, :invalid
  }

  describe "GET #index" do
    it 'assigns all unsubscribe_levels as @unsubscribe_levels' do
      unsubscribe_level = UnsubscribeLevel.create! valid_attributes
      get :index
      expect(assigns(:unsubscribe_levels)).to eq([unsubscribe_level])
    end
  end

  describe "GET #show" do
    it 'assigns the requested unsubscribe_level as @unsubscribe_level' do
      unsubscribe_level = UnsubscribeLevel.create! valid_attributes
      get :show, id: unsubscribe_level.to_param
      expect(assigns(:unsubscribe_level)).to eq(unsubscribe_level)
    end
  end

  describe "GET #new" do
    it 'assigns a new unsubscribe_level as @unsubscribe_level' do
      get :new
      expect(assigns(:unsubscribe_level)).to be_a_new(UnsubscribeLevel)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested unsubscribe_level as @unsubscribe_level' do
      unsubscribe_level = UnsubscribeLevel.create! valid_attributes
      get :edit, id: unsubscribe_level.to_param
      expect(assigns(:unsubscribe_level)).to eq(unsubscribe_level)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new UnsubscribeLevel' do
        expect {
          post :create, unsubscribe_level: valid_attributes
        }.to change(UnsubscribeLevel, :count).by(1)
      end

      it 'assigns a newly created unsubscribe_level as @unsubscribe_level' do
        post :create, unsubscribe_level: valid_attributes
        expect(assigns(:unsubscribe_level)).to be_a(UnsubscribeLevel)
        expect(assigns(:unsubscribe_level)).to be_persisted
      end

      it 'redirects to the created unsubscribe_level' do
        post :create, unsubscribe_level: valid_attributes
        expect(response).to redirect_to(unsubscribe_levels_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved unsubscribe_level as @unsubscribe_level' do
        post :create, unsubscribe_level: invalid_attributes
        expect(assigns(:unsubscribe_level)).to be_a_new(UnsubscribeLevel)
      end

      it 're-renders the "new" template' do
        post :create, unsubscribe_level: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested unsubscribe_level' do
        unsubscribe_level = UnsubscribeLevel.create! valid_attributes
        put :update, id: unsubscribe_level.to_param, unsubscribe_level: new_attributes
        unsubscribe_level.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested unsubscribe_level as @unsubscribe_level' do
        unsubscribe_level = UnsubscribeLevel.create! valid_attributes
        put :update, id: unsubscribe_level.to_param, unsubscribe_level: valid_attributes
        expect(assigns(:unsubscribe_level)).to eq(unsubscribe_level)
      end

      it 'redirects to unsubscribe_levels' do
        unsubscribe_level = UnsubscribeLevel.create! valid_attributes
        put :update, id: unsubscribe_level.to_param, unsubscribe_level: valid_attributes
        expect(response).to redirect_to(unsubscribe_levels_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the unsubscribe_level as @unsubscribe_level' do
        unsubscribe_level = UnsubscribeLevel.create! valid_attributes
        put :update, id: unsubscribe_level.to_param, unsubscribe_level: invalid_attributes
        expect(assigns(:unsubscribe_level)).to eq(unsubscribe_level)
      end

      it 're-renders the "edit" template' do
        unsubscribe_level = UnsubscribeLevel.create! valid_attributes
        put :update, id: unsubscribe_level.to_param, unsubscribe_level: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested unsubscribe_level' do
      unsubscribe_level = UnsubscribeLevel.create! valid_attributes
      expect {
        delete :destroy, id: unsubscribe_level.to_param
      }.to change(UnsubscribeLevel, :count).by(unsubscribe_level.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the unsubscribe_levels list' do
      unsubscribe_level = UnsubscribeLevel.create! valid_attributes
      delete :destroy, id: unsubscribe_level.to_param
      expect(response).to redirect_to(unsubscribe_levels_url)
    end
  end

end
