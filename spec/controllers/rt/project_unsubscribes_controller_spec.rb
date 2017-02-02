require 'rails_helper'

RSpec.describe Rt::ProjectUnsubscribesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :project_unsubscribe
  }

  let(:invalid_attributes) {
    attributes_for :project_unsubscribe, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_project_unsubscribes as @rt_project_unsubscribes' do
      project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
      get :index
      expect(assigns(:rt_project_unsubscribes)).to eq([project_unsubscribe])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_project_unsubscribe as @rt_project_unsubscribe' do
      project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
      get :show, id: project_unsubscribe.to_param
      expect(assigns(:rt_project_unsubscribe)).to eq(project_unsubscribe)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_project_unsubscribe as @rt_project_unsubscribe' do
      get :new
      expect(assigns(:rt_project_unsubscribe)).to be_a_new(Rt::ProjectUnsubscribe)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_project_unsubscribe as @rt_project_unsubscribe' do
      project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
      get :edit, id: project_unsubscribe.to_param
      expect(assigns(:rt_project_unsubscribe)).to eq(project_unsubscribe)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::ProjectUnsubscribe' do
        expect {
          post :create, rt_project_unsubscribe: valid_attributes
        }.to change(Rt::ProjectUnsubscribe, :count).by(1)
      end

      it 'assigns a newly created rt_project_unsubscribe as @rt_project_unsubscribe' do
        post :create, rt_project_unsubscribe: valid_attributes
        expect(assigns(:rt_project_unsubscribe)).to be_a(Rt::ProjectUnsubscribe)
        expect(assigns(:rt_project_unsubscribe)).to be_persisted
      end

      it 'redirects to the created rt_project_unsubscribe' do
        post :create, rt_project_unsubscribe: valid_attributes
        expect(response).to redirect_to(rt_project_unsubscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_project_unsubscribe as @rt_project_unsubscribe' do
        post :create, rt_project_unsubscribe: invalid_attributes
        expect(assigns(:rt_project_unsubscribe)).to be_a_new(Rt::ProjectUnsubscribe)
      end

      it 're-renders the "new" template' do
        post :create, rt_project_unsubscribe: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_project_unsubscribe' do
        project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
        put :update, id: project_unsubscribe.to_param, rt_project_unsubscribe: new_attributes
        project_unsubscribe.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_project_unsubscribe as @rt_project_unsubscribe' do
        project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
        put :update, id: project_unsubscribe.to_param, rt_project_unsubscribe: valid_attributes
        expect(assigns(:rt_project_unsubscribe)).to eq(project_unsubscribe)
      end

      it 'redirects to rt_project_unsubscribes' do
        project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
        put :update, id: project_unsubscribe.to_param, rt_project_unsubscribe: valid_attributes
        expect(response).to redirect_to(rt_project_unsubscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_project_unsubscribe as @rt_project_unsubscribe' do
        project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
        put :update, id: project_unsubscribe.to_param, rt_project_unsubscribe: invalid_attributes
        expect(assigns(:rt_project_unsubscribe)).to eq(project_unsubscribe)
      end

      it 're-renders the "edit" template' do
        project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
        put :update, id: project_unsubscribe.to_param, rt_project_unsubscribe: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_project_unsubscribe' do
      project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
      expect {
        delete :destroy, id: project_unsubscribe.to_param
      }.to change(Rt::ProjectUnsubscribe, :count).by(project_unsubscribe.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_project_unsubscribes list' do
      project_unsubscribe = Rt::ProjectUnsubscribe.create! valid_attributes
      delete :destroy, id: project_unsubscribe.to_param
      expect(response).to redirect_to(rt_project_unsubscribes_url)
    end
  end

end