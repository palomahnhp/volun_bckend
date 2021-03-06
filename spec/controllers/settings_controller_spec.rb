require 'rails_helper'

RSpec.describe SettingsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :setting
  }

  let(:invalid_attributes) {
    attributes_for :setting, :invalid
  }

  describe "GET #index" do
    it 'assigns all settings as @settings' do
      setting = Setting.create! valid_attributes
      get :index
      expect(assigns(:settings)).to eq([setting])
    end
  end

  describe "GET #show" do
    it 'assigns the requested setting as @setting' do
      setting = Setting.create! valid_attributes
      get :show, id: setting.to_param
      expect(assigns(:setting)).to eq(setting)
    end
  end

  describe "GET #new" do
    it 'assigns a new setting as @setting' do
      get :new
      expect(assigns(:setting)).to be_a_new(Setting)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested setting as @setting' do
      setting = Setting.create! valid_attributes
      get :edit, id: setting.to_param
      expect(assigns(:setting)).to eq(setting)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Setting' do
        expect {
          post :create, setting: valid_attributes
        }.to change(Setting, :count).by(1)
      end

      it 'assigns a newly created setting as @setting' do
        post :create, setting: valid_attributes
        expect(assigns(:setting)).to be_a(Setting)
        expect(assigns(:setting)).to be_persisted
      end

      it 'redirects to the created setting' do
        post :create, setting: valid_attributes
        expect(response).to redirect_to(settings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved setting as @setting' do
        skip("No posibility of invalid params")
        post :create, setting: invalid_attributes
        expect(assigns(:setting)).to be_a_new(Setting)
      end

      it 're-renders the "new" template' do
        skip("No posibility of invalid params")
        post :create, setting: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested setting' do
        setting = Setting.create! valid_attributes
        put :update, id: setting.to_param, setting: new_attributes
        setting.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested setting as @setting' do
        setting = Setting.create! valid_attributes
        put :update, id: setting.to_param, setting: valid_attributes
        expect(assigns(:setting)).to eq(setting)
      end

      it 'redirects to settings' do
        setting = Setting.create! valid_attributes
        put :update, id: setting.to_param, setting: valid_attributes
        expect(response).to redirect_to(settings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the setting as @setting' do
        setting = Setting.create! valid_attributes
        put :update, id: setting.to_param, setting: invalid_attributes
        expect(assigns(:setting)).to eq(setting)
      end

      it 're-renders the "edit" template' do
        skip("No posibility of invalid params")
        setting = Setting.create! valid_attributes
        put :update, id: setting.to_param, setting: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested setting' do
      setting = Setting.create! valid_attributes
      expect {
        delete :destroy, id: setting.to_param
      }.to change(Setting, :count).by(setting.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the settings list' do
      setting = Setting.create! valid_attributes
      delete :destroy, id: setting.to_param
      expect(response).to redirect_to(settings_url)
    end
  end

end
