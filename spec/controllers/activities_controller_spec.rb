require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :activity
  }

  let(:invalid_attributes) {
    attributes_for :activity, :invalid
  }

  describe "GET #index" do
    it 'assigns all activities as @activities' do
      activity = Activity.create! valid_attributes
      get :index
      expect(assigns(:activities)).to eq([activity])
    end
  end

  describe "GET #show" do
    it 'assigns the requested activity as @activity' do
      activity = Activity.create! valid_attributes
      get :show, id: activity.to_param
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe "GET #new" do
    it 'assigns a new activity as @activity' do
      get :new
      expect(assigns(:activity)).to be_a_new(Activity)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested activity as @activity' do
      activity = Activity.create! valid_attributes
      get :edit, id: activity.to_param
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Activity' do
        expect {
          post :create, activity: valid_attributes
        }.to change(Activity, :count).by(1)
      end

      it 'assigns a newly created activity as @activity' do
        post :create, activity: valid_attributes
        expect(assigns(:activity)).to be_a(Activity)
        expect(assigns(:activity)).to be_persisted
      end

      it 'redirects to the created activity' do
        post :create, activity: valid_attributes
        expect(response).to redirect_to(activities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved activity as @activity' do
        post :create, activity: invalid_attributes
        expect(assigns(:activity)).to be_a_new(Activity)
      end

      it 're-renders the "new" template' do
        post :create, activity: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested activity' do
        activity = Activity.create! valid_attributes
        put :update, id: activity.to_param, activity: new_attributes
        activity.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested activity as @activity' do
        activity = Activity.create! valid_attributes
        put :update, id: activity.to_param, activity: valid_attributes
        expect(assigns(:activity)).to eq(activity)
      end

      it 'redirects to activities' do
        activity = Activity.create! valid_attributes
        put :update, id: activity.to_param, activity: valid_attributes
        expect(response).to redirect_to(activities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the activity as @activity' do
        activity = Activity.create! valid_attributes
        put :update, id: activity.to_param, activity: invalid_attributes
        expect(assigns(:activity)).to eq(activity)
      end

      it 're-renders the "edit" template' do
        activity = Activity.create! valid_attributes
        put :update, id: activity.to_param, activity: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested activity' do
      activity = Activity.create! valid_attributes
      expect {
        delete :destroy, id: activity.to_param
      }.to change(Activity, :count).by(activity.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the activities list' do
      activity = Activity.create! valid_attributes
      delete :destroy, id: activity.to_param
      expect(response).to redirect_to(activities_url)
    end
  end

end
