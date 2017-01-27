require 'rails_helper'

RSpec.describe ProvincesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :province
  }

  let(:invalid_attributes) {
    attributes_for :province, :invalid
  }

  describe "GET #index" do
    it 'assigns all provinces as @provinces' do
      province = Province.create! valid_attributes
      get :index
      expect(assigns(:provinces)).to eq([province])
    end
  end

  describe "GET #show" do
    it 'assigns the requested province as @province' do
      province = Province.create! valid_attributes
      get :show, id: province.to_param
      expect(assigns(:province)).to eq(province)
    end
  end

  describe "GET #new" do
    it 'assigns a new province as @province' do
      get :new
      expect(assigns(:province)).to be_a_new(Province)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested province as @province' do
      province = Province.create! valid_attributes
      get :edit, id: province.to_param
      expect(assigns(:province)).to eq(province)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Province' do
        expect {
          post :create, province: valid_attributes
        }.to change(Province, :count).by(1)
      end

      it 'assigns a newly created province as @province' do
        post :create, province: valid_attributes
        expect(assigns(:province)).to be_a(Province)
        expect(assigns(:province)).to be_persisted
      end

      it 'redirects to the created province' do
        post :create, province: valid_attributes
        expect(response).to redirect_to(provinces_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved province as @province' do
        post :create, province: invalid_attributes
        expect(assigns(:province)).to be_a_new(Province)
      end

      it 're-renders the "new" template' do
        post :create, province: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested province' do
        province = Province.create! valid_attributes
        put :update, id: province.to_param, province: new_attributes
        province.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested province as @province' do
        province = Province.create! valid_attributes
        put :update, id: province.to_param, province: valid_attributes
        expect(assigns(:province)).to eq(province)
      end

      it 'redirects to provinces' do
        province = Province.create! valid_attributes
        put :update, id: province.to_param, province: valid_attributes
        expect(response).to redirect_to(provinces_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the province as @province' do
        province = Province.create! valid_attributes
        put :update, id: province.to_param, province: invalid_attributes
        expect(assigns(:province)).to eq(province)
      end

      it 're-renders the "edit" template' do
        province = Province.create! valid_attributes
        put :update, id: province.to_param, province: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested province' do
      province = Province.create! valid_attributes
      expect {
        delete :destroy, id: province.to_param
      }.to change(Province, :count).by(province.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the provinces list' do
      province = Province.create! valid_attributes
      delete :destroy, id: province.to_param
      expect(response).to redirect_to(provinces_url)
    end
  end

end
