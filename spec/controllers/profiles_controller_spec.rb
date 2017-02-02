require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :profile
  }

  let(:invalid_attributes) {
    attributes_for :profile, :invalid
  }

  describe "GET #index" do
    it 'assigns all profiles as @profiles' do
      profile = Profile.create! valid_attributes
      get :index
      expect(assigns(:profiles)).to eq([profile])
    end
  end

  describe "GET #show" do
    it 'assigns the requested profile as @profile' do
      profile = Profile.create! valid_attributes
      get :show, id: profile.to_param
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe "GET #new" do
    it 'assigns a new profile as @profile' do
      get :new
      expect(assigns(:profile)).to be_a_new(Profile)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested profile as @profile' do
      profile = Profile.create! valid_attributes
      get :edit, id: profile.to_param
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Profile' do
        expect {
          post :create, profile: valid_attributes
        }.to change(Profile, :count).by(1)
      end

      it 'assigns a newly created profile as @profile' do
        post :create, profile: valid_attributes
        expect(assigns(:profile)).to be_a(Profile)
        expect(assigns(:profile)).to be_persisted
      end

      it 'redirects to the created profile' do
        post :create, profile: valid_attributes
        expect(response).to redirect_to(profiles_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved profile as @profile' do
        post :create, profile: invalid_attributes
        expect(assigns(:profile)).to be_a_new(Profile)
      end

      it 're-renders the "new" template' do
        post :create, profile: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested profile' do
        profile = Profile.create! valid_attributes
        put :update, id: profile.to_param, profile: new_attributes
        profile.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested profile as @profile' do
        profile = Profile.create! valid_attributes
        put :update, id: profile.to_param, profile: valid_attributes
        expect(assigns(:profile)).to eq(profile)
      end

      it 'redirects to profiles' do
        profile = Profile.create! valid_attributes
        put :update, id: profile.to_param, profile: valid_attributes
        expect(response).to redirect_to(profiles_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the profile as @profile' do
        profile = Profile.create! valid_attributes
        put :update, id: profile.to_param, profile: invalid_attributes
        expect(assigns(:profile)).to eq(profile)
      end

      it 're-renders the "edit" template' do
        profile = Profile.create! valid_attributes
        put :update, id: profile.to_param, profile: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested profile' do
      profile = Profile.create! valid_attributes
      expect {
        delete :destroy, id: profile.to_param
      }.to change(Profile, :count).by(profile.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the profiles list' do
      profile = Profile.create! valid_attributes
      delete :destroy, id: profile.to_param
      expect(response).to redirect_to(profiles_url)
    end
  end

end
