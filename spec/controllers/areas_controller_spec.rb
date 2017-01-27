require 'rails_helper'

RSpec.describe AreasController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :area
  }

  let(:invalid_attributes) {
    attributes_for :area, :invalid
  }

  describe "GET #index" do
    it 'assigns all areas as @areas' do
      area = Area.create! valid_attributes
      get :index
      expect(assigns(:areas)).to eq([area])
    end
  end

  describe "GET #show" do
    it 'assigns the requested area as @area' do
      area = Area.create! valid_attributes
      get :show, id: area.to_param
      expect(assigns(:area)).to eq(area)
    end
  end

  describe "GET #new" do
    it 'assigns a new area as @area' do
      get :new
      expect(assigns(:area)).to be_a_new(Area)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested area as @area' do
      area = Area.create! valid_attributes
      get :edit, id: area.to_param
      expect(assigns(:area)).to eq(area)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Area' do
        expect {
          post :create, area: valid_attributes
        }.to change(Area, :count).by(1)
      end

      it 'assigns a newly created area as @area' do
        post :create, area: valid_attributes
        expect(assigns(:area)).to be_a(Area)
        expect(assigns(:area)).to be_persisted
      end

      it 'redirects to the created area' do
        post :create, area: valid_attributes
        expect(response).to redirect_to(areas_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved area as @area' do
        post :create, area: invalid_attributes
        expect(assigns(:area)).to be_a_new(Area)
      end

      it 're-renders the "new" template' do
        post :create, area: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested area' do
        area = Area.create! valid_attributes
        put :update, id: area.to_param, area: new_attributes
        area.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested area as @area' do
        area = Area.create! valid_attributes
        put :update, id: area.to_param, area: valid_attributes
        expect(assigns(:area)).to eq(area)
      end

      it 'redirects to areas' do
        area = Area.create! valid_attributes
        put :update, id: area.to_param, area: valid_attributes
        expect(response).to redirect_to(areas_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the area as @area' do
        area = Area.create! valid_attributes
        put :update, id: area.to_param, area: invalid_attributes
        expect(assigns(:area)).to eq(area)
      end

      it 're-renders the "edit" template' do
        area = Area.create! valid_attributes
        put :update, id: area.to_param, area: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested area' do
      area = Area.create! valid_attributes
      expect {
        delete :destroy, id: area.to_param
      }.to change(Area, :count).by(area.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the areas list' do
      area = Area.create! valid_attributes
      delete :destroy, id: area.to_param
      expect(response).to redirect_to(areas_url)
    end
  end

end
