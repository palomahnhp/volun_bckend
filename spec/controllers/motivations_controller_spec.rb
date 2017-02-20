require 'rails_helper'

RSpec.describe MotivationsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :motivation
  }

  let(:invalid_attributes) {
    attributes_for :motivation, :invalid
  }

  describe "GET #index" do
    it 'assigns all motivations as @motivations' do
      motivation = Motivation.create! valid_attributes
      get :index
      expect(assigns(:motivations)).to eq([motivation])
    end
  end

  describe "GET #show" do
    it 'assigns the requested motivation as @motivation' do
      motivation = Motivation.create! valid_attributes
      get :show, id: motivation.to_param
      expect(assigns(:motivation)).to eq(motivation)
    end
  end

  describe "GET #new" do
    it 'assigns a new motivation as @motivation' do
      get :new
      expect(assigns(:motivation)).to be_a_new(Motivation)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested motivation as @motivation' do
      motivation = Motivation.create! valid_attributes
      get :edit, id: motivation.to_param
      expect(assigns(:motivation)).to eq(motivation)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Motivation' do
        expect {
          post :create, motivation: valid_attributes
        }.to change(Motivation, :count).by(1)
      end

      it 'assigns a newly created motivation as @motivation' do
        post :create, motivation: valid_attributes
        expect(assigns(:motivation)).to be_a(Motivation)
        expect(assigns(:motivation)).to be_persisted
      end

      it 'redirects to the created motivation' do
        post :create, motivation: valid_attributes
        expect(response).to redirect_to(motivations_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved motivation as @motivation' do
        post :create, motivation: invalid_attributes
        expect(assigns(:motivation)).to be_a_new(Motivation)
      end

      it 're-renders the "new" template' do
        post :create, motivation: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested motivation' do
        motivation = Motivation.create! valid_attributes
        put :update, id: motivation.to_param, motivation: new_attributes
        motivation.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested motivation as @motivation' do
        motivation = Motivation.create! valid_attributes
        put :update, id: motivation.to_param, motivation: valid_attributes
        expect(assigns(:motivation)).to eq(motivation)
      end

      it 'redirects to motivations' do
        motivation = Motivation.create! valid_attributes
        put :update, id: motivation.to_param, motivation: valid_attributes
        expect(response).to redirect_to(motivations_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the motivation as @motivation' do
        motivation = Motivation.create! valid_attributes
        put :update, id: motivation.to_param, motivation: invalid_attributes
        expect(assigns(:motivation)).to eq(motivation)
      end

      it 're-renders the "edit" template' do
        motivation = Motivation.create! valid_attributes
        put :update, id: motivation.to_param, motivation: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested motivation' do
      motivation = Motivation.create! valid_attributes
      expect {
        delete :destroy, id: motivation.to_param
      }.to change(Motivation, :count).by(motivation.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the motivations list' do
      motivation = Motivation.create! valid_attributes
      delete :destroy, id: motivation.to_param
      expect(response).to redirect_to(motivations_url)
    end
  end

end
