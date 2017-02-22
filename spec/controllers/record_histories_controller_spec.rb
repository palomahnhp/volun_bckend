require 'rails_helper'

RSpec.describe RecordHistoriesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :record_history
  }

  let(:invalid_attributes) {
    attributes_for :record_history, :invalid
  }

  describe "GET #index" do
    it 'assigns all record_histories as @record_histories' do
      record_history = RecordHistory.create! valid_attributes
      get :index
      expect(assigns(:record_histories)).to eq([record_history])
    end
  end

  describe "GET #show" do
    it 'assigns the requested record_history as @record_history' do
      record_history = RecordHistory.create! valid_attributes
      get :show, id: record_history.to_param
      expect(assigns(:record_history)).to eq(record_history)
    end
  end

  describe "GET #new" do
    it 'assigns a new record_history as @record_history' do
      get :new
      expect(assigns(:record_history)).to be_a_new(RecordHistory)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested record_history as @record_history' do
      record_history = RecordHistory.create! valid_attributes
      get :edit, id: record_history.to_param
      expect(assigns(:record_history)).to eq(record_history)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new RecordHistory' do
        expect {
          post :create, record_history: valid_attributes
        }.to change(RecordHistory, :count).by(1)
      end

      it 'assigns a newly created record_history as @record_history' do
        post :create, record_history: valid_attributes
        expect(assigns(:record_history)).to be_a(RecordHistory)
        expect(assigns(:record_history)).to be_persisted
      end

      it 'redirects to the created record_history' do
        post :create, record_history: valid_attributes
        expect(response).to redirect_to(record_histories_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved record_history as @record_history' do
        post :create, record_history: invalid_attributes
        expect(assigns(:record_history)).to be_a_new(RecordHistory)
      end

      it 're-renders the "new" template' do
        post :create, record_history: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested record_history' do
        record_history = RecordHistory.create! valid_attributes
        put :update, id: record_history.to_param, record_history: new_attributes
        record_history.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested record_history as @record_history' do
        record_history = RecordHistory.create! valid_attributes
        put :update, id: record_history.to_param, record_history: valid_attributes
        expect(assigns(:record_history)).to eq(record_history)
      end

      it 'redirects to record_histories' do
        record_history = RecordHistory.create! valid_attributes
        put :update, id: record_history.to_param, record_history: valid_attributes
        expect(response).to redirect_to(record_histories_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the record_history as @record_history' do
        record_history = RecordHistory.create! valid_attributes
        put :update, id: record_history.to_param, record_history: invalid_attributes
        expect(assigns(:record_history)).to eq(record_history)
      end

      it 're-renders the "edit" template' do
        record_history = RecordHistory.create! valid_attributes
        put :update, id: record_history.to_param, record_history: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested record_history' do
      record_history = RecordHistory.create! valid_attributes
      expect {
        delete :destroy, id: record_history.to_param
      }.to change(RecordHistory, :count).by(record_history.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the record_histories list' do
      record_history = RecordHistory.create! valid_attributes
      delete :destroy, id: record_history.to_param
      expect(response).to redirect_to(record_histories_url)
    end
  end

end
