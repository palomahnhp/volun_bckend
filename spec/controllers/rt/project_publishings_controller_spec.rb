require 'rails_helper'

RSpec.describe Rt::ProjectPublishingsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :project_publishing
  }

  let(:invalid_attributes) {
    attributes_for :project_publishing, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_project_publishings as @rt_project_publishings' do
      project_publishing = Rt::ProjectPublishing.create! valid_attributes
      get :index
      expect(assigns(:rt_project_publishings)).to eq([project_publishing])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_project_publishing as @rt_project_publishing' do
      project_publishing = Rt::ProjectPublishing.create! valid_attributes
      get :show, id: project_publishing.to_param
      expect(assigns(:rt_project_publishing)).to eq(project_publishing)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_project_publishing as @rt_project_publishing' do
      get :new
      expect(assigns(:rt_project_publishing)).to be_a_new(Rt::ProjectPublishing)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_project_publishing as @rt_project_publishing' do
      project_publishing = Rt::ProjectPublishing.create! valid_attributes
      get :edit, id: project_publishing.to_param
      expect(assigns(:rt_project_publishing)).to eq(project_publishing)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::ProjectPublishing' do
        expect {
          post :create, rt_project_publishing: valid_attributes
        }.to change(Rt::ProjectPublishing, :count).by(1)
      end

      it 'assigns a newly created rt_project_publishing as @rt_project_publishing' do
        post :create, rt_project_publishing: valid_attributes
        expect(assigns(:rt_project_publishing)).to be_a(Rt::ProjectPublishing)
        expect(assigns(:rt_project_publishing)).to be_persisted
      end

      it 'redirects to the created rt_project_publishing' do
        post :create, rt_project_publishing: valid_attributes
        expect(response).to redirect_to(rt_project_publishings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_project_publishing as @rt_project_publishing' do
        post :create, rt_project_publishing: invalid_attributes
        expect(assigns(:rt_project_publishing)).to be_a_new(Rt::ProjectPublishing)
      end

      it 're-renders the "new" template' do
        post :create, rt_project_publishing: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_project_publishing' do
        project_publishing = Rt::ProjectPublishing.create! valid_attributes
        put :update, id: project_publishing.to_param, rt_project_publishing: new_attributes
        project_publishing.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_project_publishing as @rt_project_publishing' do
        project_publishing = Rt::ProjectPublishing.create! valid_attributes
        put :update, id: project_publishing.to_param, rt_project_publishing: valid_attributes
        expect(assigns(:rt_project_publishing)).to eq(project_publishing)
      end

      it 'redirects to rt_project_publishings' do
        project_publishing = Rt::ProjectPublishing.create! valid_attributes
        put :update, id: project_publishing.to_param, rt_project_publishing: valid_attributes
        expect(response).to redirect_to(rt_project_publishings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_project_publishing as @rt_project_publishing' do
        project_publishing = Rt::ProjectPublishing.create! valid_attributes
        put :update, id: project_publishing.to_param, rt_project_publishing: invalid_attributes
        expect(assigns(:rt_project_publishing)).to eq(project_publishing)
      end

      it 're-renders the "edit" template' do
        project_publishing = Rt::ProjectPublishing.create! valid_attributes
        put :update, id: project_publishing.to_param, rt_project_publishing: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_project_publishing' do
      project_publishing = Rt::ProjectPublishing.create! valid_attributes
      expect {
        delete :destroy, id: project_publishing.to_param
      }.to change(Rt::ProjectPublishing, :count).by(project_publishing.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_project_publishings list' do
      project_publishing = Rt::ProjectPublishing.create! valid_attributes
      delete :destroy, id: project_publishing.to_param
      expect(response).to redirect_to(rt_project_publishings_url)
    end
  end

end
