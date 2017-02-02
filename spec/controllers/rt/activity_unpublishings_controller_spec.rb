require 'rails_helper'

RSpec.describe Rt::ActivityUnpublishingsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :activity_unpublishing
  }

  let(:invalid_attributes) {
    attributes_for :activity_unpublishing, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_activity_unpublishings as @rt_activity_unpublishings' do
      activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
      get :index
      expect(assigns(:rt_activity_unpublishings)).to eq([activity_unpublishing])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_activity_unpublishing as @rt_activity_unpublishing' do
      activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
      get :show, id: activity_unpublishing.to_param
      expect(assigns(:rt_activity_unpublishing)).to eq(activity_unpublishing)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_activity_unpublishing as @rt_activity_unpublishing' do
      get :new
      expect(assigns(:rt_activity_unpublishing)).to be_a_new(Rt::ActivityUnpublishing)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_activity_unpublishing as @rt_activity_unpublishing' do
      activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
      get :edit, id: activity_unpublishing.to_param
      expect(assigns(:rt_activity_unpublishing)).to eq(activity_unpublishing)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::ActivityUnpublishing' do
        expect {
          post :create, rt_activity_unpublishing: valid_attributes
        }.to change(Rt::ActivityUnpublishing, :count).by(1)
      end

      it 'assigns a newly created rt_activity_unpublishing as @rt_activity_unpublishing' do
        post :create, rt_activity_unpublishing: valid_attributes
        expect(assigns(:rt_activity_unpublishing)).to be_a(Rt::ActivityUnpublishing)
        expect(assigns(:rt_activity_unpublishing)).to be_persisted
      end

      it 'redirects to the created rt_activity_unpublishing' do
        post :create, rt_activity_unpublishing: valid_attributes
        expect(response).to redirect_to(rt_activity_unpublishings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_activity_unpublishing as @rt_activity_unpublishing' do
        post :create, rt_activity_unpublishing: invalid_attributes
        expect(assigns(:rt_activity_unpublishing)).to be_a_new(Rt::ActivityUnpublishing)
      end

      it 're-renders the "new" template' do
        post :create, rt_activity_unpublishing: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_activity_unpublishing' do
        activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
        put :update, id: activity_unpublishing.to_param, rt_activity_unpublishing: new_attributes
        activity_unpublishing.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_activity_unpublishing as @rt_activity_unpublishing' do
        activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
        put :update, id: activity_unpublishing.to_param, rt_activity_unpublishing: valid_attributes
        expect(assigns(:rt_activity_unpublishing)).to eq(activity_unpublishing)
      end

      it 'redirects to rt_activity_unpublishings' do
        activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
        put :update, id: activity_unpublishing.to_param, rt_activity_unpublishing: valid_attributes
        expect(response).to redirect_to(rt_activity_unpublishings_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_activity_unpublishing as @rt_activity_unpublishing' do
        activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
        put :update, id: activity_unpublishing.to_param, rt_activity_unpublishing: invalid_attributes
        expect(assigns(:rt_activity_unpublishing)).to eq(activity_unpublishing)
      end

      it 're-renders the "edit" template' do
        activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
        put :update, id: activity_unpublishing.to_param, rt_activity_unpublishing: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_activity_unpublishing' do
      activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
      expect {
        delete :destroy, id: activity_unpublishing.to_param
      }.to change(Rt::ActivityUnpublishing, :count).by(activity_unpublishing.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_activity_unpublishings list' do
      activity_unpublishing = Rt::ActivityUnpublishing.create! valid_attributes
      delete :destroy, id: activity_unpublishing.to_param
      expect(response).to redirect_to(rt_activity_unpublishings_url)
    end
  end

end
