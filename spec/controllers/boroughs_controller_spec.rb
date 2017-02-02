require 'rails_helper'

RSpec.describe BoroughsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :borough
  }

  let(:invalid_attributes) {
    attributes_for :borough, :invalid
  }

  describe "GET #index" do
    it 'assigns all boroughs as @boroughs' do
      borough = Borough.create! valid_attributes
      get :index
      expect(assigns(:boroughs)).to eq([borough])
    end
  end

  describe "GET #show" do
    it 'assigns the requested borough as @borough' do
      borough = Borough.create! valid_attributes
      get :show, id: borough.to_param
      expect(assigns(:borough)).to eq(borough)
    end
  end

  describe "GET #new" do
    it 'assigns a new borough as @borough' do
      get :new
      expect(assigns(:borough)).to be_a_new(Borough)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested borough as @borough' do
      borough = Borough.create! valid_attributes
      get :edit, id: borough.to_param
      expect(assigns(:borough)).to eq(borough)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Borough' do
        expect {
          post :create, borough: valid_attributes
        }.to change(Borough, :count).by(1)
      end

      it 'assigns a newly created borough as @borough' do
        post :create, borough: valid_attributes
        expect(assigns(:borough)).to be_a(Borough)
        expect(assigns(:borough)).to be_persisted
      end

      it 'redirects to the created borough' do
        post :create, borough: valid_attributes
        expect(response).to redirect_to(boroughs_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved borough as @borough' do
        post :create, borough: invalid_attributes
        expect(assigns(:borough)).to be_a_new(Borough)
      end

      it 're-renders the "new" template' do
        post :create, borough: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested borough' do
        borough = Borough.create! valid_attributes
        put :update, id: borough.to_param, borough: new_attributes
        borough.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested borough as @borough' do
        borough = Borough.create! valid_attributes
        put :update, id: borough.to_param, borough: valid_attributes
        expect(assigns(:borough)).to eq(borough)
      end

      it 'redirects to boroughs' do
        borough = Borough.create! valid_attributes
        put :update, id: borough.to_param, borough: valid_attributes
        expect(response).to redirect_to(boroughs_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the borough as @borough' do
        borough = Borough.create! valid_attributes
        put :update, id: borough.to_param, borough: invalid_attributes
        expect(assigns(:borough)).to eq(borough)
      end

      it 're-renders the "edit" template' do
        borough = Borough.create! valid_attributes
        put :update, id: borough.to_param, borough: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested borough' do
      borough = Borough.create! valid_attributes
      expect {
        delete :destroy, id: borough.to_param
      }.to change(Borough, :count).by(borough.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the boroughs list' do
      borough = Borough.create! valid_attributes
      delete :destroy, id: borough.to_param
      expect(response).to redirect_to(boroughs_url)
    end
  end

end
