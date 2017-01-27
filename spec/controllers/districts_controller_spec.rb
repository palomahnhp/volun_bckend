require 'rails_helper'

RSpec.describe DistrictsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :district
  }

  let(:invalid_attributes) {
    attributes_for :district, :invalid
  }

  describe "GET #index" do
    it 'assigns all districts as @districts' do
      district = District.create! valid_attributes
      get :index
      expect(assigns(:districts)).to eq([district])
    end
  end

  describe "GET #show" do
    it 'assigns the requested district as @district' do
      district = District.create! valid_attributes
      get :show, id: district.to_param
      expect(assigns(:district)).to eq(district)
    end
  end

  describe "GET #new" do
    it 'assigns a new district as @district' do
      get :new
      expect(assigns(:district)).to be_a_new(District)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested district as @district' do
      district = District.create! valid_attributes
      get :edit, id: district.to_param
      expect(assigns(:district)).to eq(district)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new District' do
        expect {
          post :create, district: valid_attributes
        }.to change(District, :count).by(1)
      end

      it 'assigns a newly created district as @district' do
        post :create, district: valid_attributes
        expect(assigns(:district)).to be_a(District)
        expect(assigns(:district)).to be_persisted
      end

      it 'redirects to the created district' do
        post :create, district: valid_attributes
        expect(response).to redirect_to(districts_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved district as @district' do
        post :create, district: invalid_attributes
        expect(assigns(:district)).to be_a_new(District)
      end

      it 're-renders the "new" template' do
        post :create, district: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested district' do
        district = District.create! valid_attributes
        put :update, id: district.to_param, district: new_attributes
        district.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested district as @district' do
        district = District.create! valid_attributes
        put :update, id: district.to_param, district: valid_attributes
        expect(assigns(:district)).to eq(district)
      end

      it 'redirects to districts' do
        district = District.create! valid_attributes
        put :update, id: district.to_param, district: valid_attributes
        expect(response).to redirect_to(districts_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the district as @district' do
        district = District.create! valid_attributes
        put :update, id: district.to_param, district: invalid_attributes
        expect(assigns(:district)).to eq(district)
      end

      it 're-renders the "edit" template' do
        district = District.create! valid_attributes
        put :update, id: district.to_param, district: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested district' do
      district = District.create! valid_attributes
      expect {
        delete :destroy, id: district.to_param
      }.to change(District, :count).by(district.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the districts list' do
      district = District.create! valid_attributes
      delete :destroy, id: district.to_param
      expect(response).to redirect_to(districts_url)
    end
  end

end
