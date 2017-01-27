require 'rails_helper'

RSpec.describe CollectivesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :collective
  }

  let(:invalid_attributes) {
    attributes_for :collective, :invalid
  }

  describe "GET #index" do
    it 'assigns all collectives as @collectives' do
      collective = Collective.create! valid_attributes
      get :index
      expect(assigns(:collectives)).to eq([collective])
    end
  end

  describe "GET #show" do
    it 'assigns the requested collective as @collective' do
      collective = Collective.create! valid_attributes
      get :show, id: collective.to_param
      expect(assigns(:collective)).to eq(collective)
    end
  end

  describe "GET #new" do
    it 'assigns a new collective as @collective' do
      get :new
      expect(assigns(:collective)).to be_a_new(Collective)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested collective as @collective' do
      collective = Collective.create! valid_attributes
      get :edit, id: collective.to_param
      expect(assigns(:collective)).to eq(collective)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Collective' do
        expect {
          post :create, collective: valid_attributes
        }.to change(Collective, :count).by(1)
      end

      it 'assigns a newly created collective as @collective' do
        post :create, collective: valid_attributes
        expect(assigns(:collective)).to be_a(Collective)
        expect(assigns(:collective)).to be_persisted
      end

      it 'redirects to the created collective' do
        post :create, collective: valid_attributes
        expect(response).to redirect_to(collectives_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved collective as @collective' do
        post :create, collective: invalid_attributes
        expect(assigns(:collective)).to be_a_new(Collective)
      end

      it 're-renders the "new" template' do
        post :create, collective: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested collective' do
        collective = Collective.create! valid_attributes
        put :update, id: collective.to_param, collective: new_attributes
        collective.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested collective as @collective' do
        collective = Collective.create! valid_attributes
        put :update, id: collective.to_param, collective: valid_attributes
        expect(assigns(:collective)).to eq(collective)
      end

      it 'redirects to collectives' do
        collective = Collective.create! valid_attributes
        put :update, id: collective.to_param, collective: valid_attributes
        expect(response).to redirect_to(collectives_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the collective as @collective' do
        collective = Collective.create! valid_attributes
        put :update, id: collective.to_param, collective: invalid_attributes
        expect(assigns(:collective)).to eq(collective)
      end

      it 're-renders the "edit" template' do
        collective = Collective.create! valid_attributes
        put :update, id: collective.to_param, collective: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested collective' do
      collective = Collective.create! valid_attributes
      expect {
        delete :destroy, id: collective.to_param
      }.to change(Collective, :count).by(collective.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the collectives list' do
      collective = Collective.create! valid_attributes
      delete :destroy, id: collective.to_param
      expect(response).to redirect_to(collectives_url)
    end
  end

end
