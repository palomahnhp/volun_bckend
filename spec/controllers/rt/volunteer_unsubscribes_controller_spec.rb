require 'rails_helper'

RSpec.describe Rt::VolunteerUnsubscribesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :volunteer_unsubscribe
  }

  let(:invalid_attributes) {
    attributes_for :volunteer_unsubscribe, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_volunteer_unsubscribes as @rt_volunteer_unsubscribes' do
      volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
      get :index
      expect(assigns(:rt_volunteer_unsubscribes)).to eq([volunteer_unsubscribe])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
      volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
      get :show, id: volunteer_unsubscribe.to_param
      expect(assigns(:rt_volunteer_unsubscribe)).to eq(volunteer_unsubscribe)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
      get :new
      expect(assigns(:rt_volunteer_unsubscribe)).to be_a_new(Rt::VolunteerUnsubscribe)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
      volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
      get :edit, id: volunteer_unsubscribe.to_param
      expect(assigns(:rt_volunteer_unsubscribe)).to eq(volunteer_unsubscribe)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::VolunteerUnsubscribe' do
        expect {
          post :create, rt_volunteer_unsubscribe: valid_attributes
        }.to change(Rt::VolunteerUnsubscribe, :count).by(1)
      end

      it 'assigns a newly created rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
        post :create, rt_volunteer_unsubscribe: valid_attributes
        expect(assigns(:rt_volunteer_unsubscribe)).to be_a(Rt::VolunteerUnsubscribe)
        expect(assigns(:rt_volunteer_unsubscribe)).to be_persisted
      end

      it 'redirects to the created rt_volunteer_unsubscribe' do
        post :create, rt_volunteer_unsubscribe: valid_attributes
        expect(response).to redirect_to(rt_volunteer_unsubscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
        post :create, rt_volunteer_unsubscribe: invalid_attributes
        expect(assigns(:rt_volunteer_unsubscribe)).to be_a_new(Rt::VolunteerUnsubscribe)
      end

      it 're-renders the "new" template' do
        post :create, rt_volunteer_unsubscribe: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_volunteer_unsubscribe' do
        volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
        put :update, id: volunteer_unsubscribe.to_param, rt_volunteer_unsubscribe: new_attributes
        volunteer_unsubscribe.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
        volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
        put :update, id: volunteer_unsubscribe.to_param, rt_volunteer_unsubscribe: valid_attributes
        expect(assigns(:rt_volunteer_unsubscribe)).to eq(volunteer_unsubscribe)
      end

      it 'redirects to rt_volunteer_unsubscribes' do
        volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
        put :update, id: volunteer_unsubscribe.to_param, rt_volunteer_unsubscribe: valid_attributes
        expect(response).to redirect_to(rt_volunteer_unsubscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
        volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
        put :update, id: volunteer_unsubscribe.to_param, rt_volunteer_unsubscribe: invalid_attributes
        expect(assigns(:rt_volunteer_unsubscribe)).to eq(volunteer_unsubscribe)
      end

      it 're-renders the "edit" template' do
        volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
        put :update, id: volunteer_unsubscribe.to_param, rt_volunteer_unsubscribe: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_volunteer_unsubscribe' do
      volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
      expect {
        delete :destroy, id: volunteer_unsubscribe.to_param
      }.to change(Rt::VolunteerUnsubscribe, :count).by(volunteer_unsubscribe.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_volunteer_unsubscribes list' do
      volunteer_unsubscribe = Rt::VolunteerUnsubscribe.create! valid_attributes
      delete :destroy, id: volunteer_unsubscribe.to_param
      expect(response).to redirect_to(rt_volunteer_unsubscribes_url)
    end
  end

end
