require 'rails_helper'

RSpec.describe CoordinationsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :coordination
  }

  let(:invalid_attributes) {
    attributes_for :coordination, :invalid
  }

  describe "GET #index" do
    it 'assigns all coordinations as @coordinations' do
      coordination = Coordination.create! valid_attributes
      get :index
      expect(assigns(:coordinations)).to eq([coordination])
    end
  end

  describe "GET #show" do
    it 'assigns the requested coordination as @coordination' do
      coordination = Coordination.create! valid_attributes
      get :show, id: coordination.to_param
      expect(assigns(:coordination)).to eq(coordination)
    end
  end

  describe "GET #new" do
    it 'assigns a new coordination as @coordination' do
      get :new
      expect(assigns(:coordination)).to be_a_new(Coordination)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested coordination as @coordination' do
      coordination = Coordination.create! valid_attributes
      get :edit, id: coordination.to_param
      expect(assigns(:coordination)).to eq(coordination)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Coordination' do
        expect {
          post :create, coordination: valid_attributes
        }.to change(Coordination, :count).by(1)
      end

      it 'assigns a newly created coordination as @coordination' do
        post :create, coordination: valid_attributes
        expect(assigns(:coordination)).to be_a(Coordination)
        expect(assigns(:coordination)).to be_persisted
      end

      it 'redirects to the created coordination' do
        post :create, coordination: valid_attributes
        expect(response).to redirect_to(coordinations_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved coordination as @coordination' do
        post :create, coordination: invalid_attributes
        expect(assigns(:coordination)).to be_a_new(Coordination)
      end

      it 're-renders the "new" template' do
        post :create, coordination: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested coordination' do
        coordination = Coordination.create! valid_attributes
        put :update, id: coordination.to_param, coordination: new_attributes
        coordination.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested coordination as @coordination' do
        coordination = Coordination.create! valid_attributes
        put :update, id: coordination.to_param, coordination: valid_attributes
        expect(assigns(:coordination)).to eq(coordination)
      end

      it 'redirects to coordinations' do
        coordination = Coordination.create! valid_attributes
        put :update, id: coordination.to_param, coordination: valid_attributes
        expect(response).to redirect_to(coordinations_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the coordination as @coordination' do
        coordination = Coordination.create! valid_attributes
        put :update, id: coordination.to_param, coordination: invalid_attributes
        expect(assigns(:coordination)).to eq(coordination)
      end

      it 're-renders the "edit" template' do
        coordination = Coordination.create! valid_attributes
        put :update, id: coordination.to_param, coordination: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested coordination' do
      coordination = Coordination.create! valid_attributes
      expect {
        delete :destroy, id: coordination.to_param
      }.to change(Coordination, :count).by(coordination.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the coordinations list' do
      coordination = Coordination.create! valid_attributes
      delete :destroy, id: coordination.to_param
      expect(response).to redirect_to(coordinations_url)
    end
  end

end
