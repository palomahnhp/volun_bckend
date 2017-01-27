require 'rails_helper'

RSpec.describe RoadTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :road_type
  }

  let(:invalid_attributes) {
    attributes_for :road_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all road_types as @road_types' do
      road_type = RoadType.create! valid_attributes
      get :index
      expect(assigns(:road_types)).to eq([road_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested road_type as @road_type' do
      road_type = RoadType.create! valid_attributes
      get :show, id: road_type.to_param
      expect(assigns(:road_type)).to eq(road_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new road_type as @road_type' do
      get :new
      expect(assigns(:road_type)).to be_a_new(RoadType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested road_type as @road_type' do
      road_type = RoadType.create! valid_attributes
      get :edit, id: road_type.to_param
      expect(assigns(:road_type)).to eq(road_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new RoadType' do
        expect {
          post :create, road_type: valid_attributes
        }.to change(RoadType, :count).by(1)
      end

      it 'assigns a newly created road_type as @road_type' do
        post :create, road_type: valid_attributes
        expect(assigns(:road_type)).to be_a(RoadType)
        expect(assigns(:road_type)).to be_persisted
      end

      it 'redirects to the created road_type' do
        post :create, road_type: valid_attributes
        expect(response).to redirect_to(road_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved road_type as @road_type' do
        post :create, road_type: invalid_attributes
        expect(assigns(:road_type)).to be_a_new(RoadType)
      end

      it 're-renders the "new" template' do
        post :create, road_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested road_type' do
        road_type = RoadType.create! valid_attributes
        put :update, id: road_type.to_param, road_type: new_attributes
        road_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested road_type as @road_type' do
        road_type = RoadType.create! valid_attributes
        put :update, id: road_type.to_param, road_type: valid_attributes
        expect(assigns(:road_type)).to eq(road_type)
      end

      it 'redirects to road_types' do
        road_type = RoadType.create! valid_attributes
        put :update, id: road_type.to_param, road_type: valid_attributes
        expect(response).to redirect_to(road_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the road_type as @road_type' do
        road_type = RoadType.create! valid_attributes
        put :update, id: road_type.to_param, road_type: invalid_attributes
        expect(assigns(:road_type)).to eq(road_type)
      end

      it 're-renders the "edit" template' do
        road_type = RoadType.create! valid_attributes
        put :update, id: road_type.to_param, road_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested road_type' do
      road_type = RoadType.create! valid_attributes
      expect {
        delete :destroy, id: road_type.to_param
      }.to change(RoadType, :count).by(road_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the road_types list' do
      road_type = RoadType.create! valid_attributes
      delete :destroy, id: road_type.to_param
      expect(response).to redirect_to(road_types_url)
    end
  end

end
