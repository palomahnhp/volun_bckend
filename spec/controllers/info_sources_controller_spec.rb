require 'rails_helper'

RSpec.describe InfoSourcesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :info_source
  }

  let(:invalid_attributes) {
    attributes_for :info_source, :invalid
  }

  describe "GET #index" do
    it 'assigns all info_sources as @info_sources' do
      info_source = InfoSource.create! valid_attributes
      get :index
      expect(assigns(:info_sources)).to eq([info_source])
    end
  end

  describe "GET #show" do
    it 'assigns the requested info_source as @info_source' do
      info_source = InfoSource.create! valid_attributes
      get :show, id: info_source.to_param
      expect(assigns(:info_source)).to eq(info_source)
    end
  end

  describe "GET #new" do
    it 'assigns a new info_source as @info_source' do
      get :new
      expect(assigns(:info_source)).to be_a_new(InfoSource)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested info_source as @info_source' do
      info_source = InfoSource.create! valid_attributes
      get :edit, id: info_source.to_param
      expect(assigns(:info_source)).to eq(info_source)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new InfoSource' do
        expect {
          post :create, info_source: valid_attributes
        }.to change(InfoSource, :count).by(1)
      end

      it 'assigns a newly created info_source as @info_source' do
        post :create, info_source: valid_attributes
        expect(assigns(:info_source)).to be_a(InfoSource)
        expect(assigns(:info_source)).to be_persisted
      end

      it 'redirects to the created info_source' do
        post :create, info_source: valid_attributes
        expect(response).to redirect_to(info_sources_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved info_source as @info_source' do
        post :create, info_source: invalid_attributes
        expect(assigns(:info_source)).to be_a_new(InfoSource)
      end

      it 're-renders the "new" template' do
        post :create, info_source: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested info_source' do
        info_source = InfoSource.create! valid_attributes
        put :update, id: info_source.to_param, info_source: new_attributes
        info_source.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested info_source as @info_source' do
        info_source = InfoSource.create! valid_attributes
        put :update, id: info_source.to_param, info_source: valid_attributes
        expect(assigns(:info_source)).to eq(info_source)
      end

      it 'redirects to info_sources' do
        info_source = InfoSource.create! valid_attributes
        put :update, id: info_source.to_param, info_source: valid_attributes
        expect(response).to redirect_to(info_sources_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the info_source as @info_source' do
        info_source = InfoSource.create! valid_attributes
        put :update, id: info_source.to_param, info_source: invalid_attributes
        expect(assigns(:info_source)).to eq(info_source)
      end

      it 're-renders the "edit" template' do
        info_source = InfoSource.create! valid_attributes
        put :update, id: info_source.to_param, info_source: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested info_source' do
      info_source = InfoSource.create! valid_attributes
      expect {
        delete :destroy, id: info_source.to_param
      }.to change(InfoSource, :count).by(info_source.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the info_sources list' do
      info_source = InfoSource.create! valid_attributes
      delete :destroy, id: info_source.to_param
      expect(response).to redirect_to(info_sources_url)
    end
  end

end
