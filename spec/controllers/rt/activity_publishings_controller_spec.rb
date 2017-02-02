require 'rails_helper'

RSpec.describe Rt::ActivityPublishingsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :activity_publishing
  }

  let(:invalid_attributes) {
    attributes_for :activity_publishing, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_activity_publishings as @rt_activity_publishings' do
      activity_publishing = Rt::ActivityPublishing.create! valid_attributes
      get :index
      expect(assigns(:rt_activity_publishings)).to eq([activity_publishing])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_activity_publishing as @rt_activity_publishing' do
      activity_publishing = Rt::ActivityPublishing.create! valid_attributes
      get :show, id: activity_publishing.to_param
      expect(assigns(:rt_activity_publishing)).to eq(activity_publishing)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_activity_publishing as @rt_activity_publishing' do
      get :new
      expect(assigns(:rt_activity_publishing)).to be_a_new(Rt::ActivityPublishing)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_activity_publishing as @rt_activity_publishing' do
      activity_publishing = Rt::ActivityPublishing.create! valid_attributes
      get :edit, id: activity_publishing.to_param
      expect(assigns(:rt_activity_publishing)).to eq(activity_publishing)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::ActivityPublishing' do
        expect {
          post :create, rt_activity_publishing: valid_attributes
        }.to change(Rt::ActivityPublishing, :count).by(1)
      end

      it 'assigns a newly created rt_activity_publishing as @rt_activity_publishing' do
        post :create, rt_activity_publishing: valid_attributes
        expect(assigns(:rt_activity_publishing)).to be_a(Rt::ActivityPublishing)
        expect(assigns(:rt_activity_publishing)).to be_persisted
      end

      it 'redirects to the created rt_activity_publishing' do
        post :create, rt_activity_publishing: valid_attributes
        expect(response).to redirect_to(rt_activity_publishings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_activity_publishing as @rt_activity_publishing' do
        post :create, rt_activity_publishing: invalid_attributes
        expect(assigns(:rt_activity_publishing)).to be_a_new(Rt::ActivityPublishing)
      end

      it 're-renders the "new" template' do
        post :create, rt_activity_publishing: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_activity_publishing' do
        activity_publishing = Rt::ActivityPublishing.create! valid_attributes
        put :update, id: activity_publishing.to_param, rt_activity_publishing: new_attributes
        activity_publishing.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_activity_publishing as @rt_activity_publishing' do
        activity_publishing = Rt::ActivityPublishing.create! valid_attributes
        put :update, id: activity_publishing.to_param, rt_activity_publishing: valid_attributes
        expect(assigns(:rt_activity_publishing)).to eq(activity_publishing)
      end

      it 'redirects to rt_activity_publishings' do
        activity_publishing = Rt::ActivityPublishing.create! valid_attributes
        put :update, id: activity_publishing.to_param, rt_activity_publishing: valid_attributes
        expect(response).to redirect_to(rt_activity_publishings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_activity_publishing as @rt_activity_publishing' do
        activity_publishing = Rt::ActivityPublishing.create! valid_attributes
        put :update, id: activity_publishing.to_param, rt_activity_publishing: invalid_attributes
        expect(assigns(:rt_activity_publishing)).to eq(activity_publishing)
      end

      it 're-renders the "edit" template' do
        activity_publishing = Rt::ActivityPublishing.create! valid_attributes
        put :update, id: activity_publishing.to_param, rt_activity_publishing: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_activity_publishing' do
      activity_publishing = Rt::ActivityPublishing.create! valid_attributes
      expect {
        delete :destroy, id: activity_publishing.to_param
      }.to change(Rt::ActivityPublishing, :count).by(activity_publishing.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_activity_publishings list' do
      activity_publishing = Rt::ActivityPublishing.create! valid_attributes
      delete :destroy, id: activity_publishing.to_param
      expect(response).to redirect_to(rt_activity_publishings_url)
    end
  end

end
