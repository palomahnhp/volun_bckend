require 'rails_helper'

RSpec.describe TimetablesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :timetable
  }

  let(:invalid_attributes) {
    attributes_for :timetable, :invalid
  }

  describe "GET #index" do
    it 'assigns all timetables as @timetables' do
      timetable = Timetable.create! valid_attributes
      get :index
      expect(assigns(:timetables)).to eq([timetable])
    end
  end

  describe "GET #show" do
    it 'assigns the requested timetable as @timetable' do
      timetable = Timetable.create! valid_attributes
      get :show, id: timetable.to_param
      expect(assigns(:timetable)).to eq(timetable)
    end
  end

  describe "GET #new" do
    it 'assigns a new timetable as @timetable' do
      get :new
      expect(assigns(:timetable)).to be_a_new(Timetable)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested timetable as @timetable' do
      timetable = Timetable.create! valid_attributes
      get :edit, id: timetable.to_param
      expect(assigns(:timetable)).to eq(timetable)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Timetable' do
        expect {
          post :create, timetable: valid_attributes
        }.to change(Timetable, :count).by(1)
      end

      it 'assigns a newly created timetable as @timetable' do
        post :create, timetable: valid_attributes
        expect(assigns(:timetable)).to be_a(Timetable)
        expect(assigns(:timetable)).to be_persisted
      end

      it 'redirects to the created timetable' do
        post :create, timetable: valid_attributes
        expect(response).to redirect_to(timetables_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved timetable as @timetable' do
        post :create, timetable: invalid_attributes
        expect(assigns(:timetable)).to be_a_new(Timetable)
      end

      it 're-renders the "new" template' do
        post :create, timetable: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested timetable' do
        timetable = Timetable.create! valid_attributes
        put :update, id: timetable.to_param, timetable: new_attributes
        timetable.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested timetable as @timetable' do
        timetable = Timetable.create! valid_attributes
        put :update, id: timetable.to_param, timetable: valid_attributes
        expect(assigns(:timetable)).to eq(timetable)
      end

      it 'redirects to timetables' do
        timetable = Timetable.create! valid_attributes
        put :update, id: timetable.to_param, timetable: valid_attributes
        expect(response).to redirect_to(timetables_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the timetable as @timetable' do
        timetable = Timetable.create! valid_attributes
        put :update, id: timetable.to_param, timetable: invalid_attributes
        expect(assigns(:timetable)).to eq(timetable)
      end

      it 're-renders the "edit" template' do
        timetable = Timetable.create! valid_attributes
        put :update, id: timetable.to_param, timetable: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested timetable' do
      timetable = Timetable.create! valid_attributes
      expect {
        delete :destroy, id: timetable.to_param
      }.to change(Timetable, :count).by(timetable.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the timetables list' do
      timetable = Timetable.create! valid_attributes
      delete :destroy, id: timetable.to_param
      expect(response).to redirect_to(timetables_url)
    end
  end

end
