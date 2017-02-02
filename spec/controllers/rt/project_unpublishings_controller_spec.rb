require 'rails_helper'

RSpec.describe Rt::ProjectUnpublishingsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :project_unpublishing
  }

  let(:invalid_attributes) {
    attributes_for :project_unpublishing, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_project_unpublishings as @rt_project_unpublishings' do
      project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
      get :index
      expect(assigns(:rt_project_unpublishings)).to eq([project_unpublishing])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_project_unpublishing as @rt_project_unpublishing' do
      project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
      get :show, id: project_unpublishing.to_param
      expect(assigns(:rt_project_unpublishing)).to eq(project_unpublishing)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_project_unpublishing as @rt_project_unpublishing' do
      get :new
      expect(assigns(:rt_project_unpublishing)).to be_a_new(Rt::ProjectUnpublishing)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_project_unpublishing as @rt_project_unpublishing' do
      project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
      get :edit, id: project_unpublishing.to_param
      expect(assigns(:rt_project_unpublishing)).to eq(project_unpublishing)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::ProjectUnpublishing' do
        expect {
          post :create, rt_project_unpublishing: valid_attributes
        }.to change(Rt::ProjectUnpublishing, :count).by(1)
      end

      it 'assigns a newly created rt_project_unpublishing as @rt_project_unpublishing' do
        post :create, rt_project_unpublishing: valid_attributes
        expect(assigns(:rt_project_unpublishing)).to be_a(Rt::ProjectUnpublishing)
        expect(assigns(:rt_project_unpublishing)).to be_persisted
      end

      it 'redirects to the created rt_project_unpublishing' do
        post :create, rt_project_unpublishing: valid_attributes
        expect(response).to redirect_to(rt_project_unpublishings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_project_unpublishing as @rt_project_unpublishing' do
        post :create, rt_project_unpublishing: invalid_attributes
        expect(assigns(:rt_project_unpublishing)).to be_a_new(Rt::ProjectUnpublishing)
      end

      it 're-renders the "new" template' do
        post :create, rt_project_unpublishing: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_project_unpublishing' do
        project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
        put :update, id: project_unpublishing.to_param, rt_project_unpublishing: new_attributes
        project_unpublishing.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_project_unpublishing as @rt_project_unpublishing' do
        project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
        put :update, id: project_unpublishing.to_param, rt_project_unpublishing: valid_attributes
        expect(assigns(:rt_project_unpublishing)).to eq(project_unpublishing)
      end

      it 'redirects to rt_project_unpublishings' do
        project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
        put :update, id: project_unpublishing.to_param, rt_project_unpublishing: valid_attributes
        expect(response).to redirect_to(rt_project_unpublishings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_project_unpublishing as @rt_project_unpublishing' do
        project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
        put :update, id: project_unpublishing.to_param, rt_project_unpublishing: invalid_attributes
        expect(assigns(:rt_project_unpublishing)).to eq(project_unpublishing)
      end

      it 're-renders the "edit" template' do
        project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
        put :update, id: project_unpublishing.to_param, rt_project_unpublishing: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_project_unpublishing' do
      project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
      expect {
        delete :destroy, id: project_unpublishing.to_param
      }.to change(Rt::ProjectUnpublishing, :count).by(project_unpublishing.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_project_unpublishings list' do
      project_unpublishing = Rt::ProjectUnpublishing.create! valid_attributes
      delete :destroy, id: project_unpublishing.to_param
      expect(response).to redirect_to(rt_project_unpublishings_url)
    end
  end

end
