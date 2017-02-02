require 'rails_helper'

RSpec.describe EventTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :event_type
  }

  let(:invalid_attributes) {
    attributes_for :event_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all event_types as @event_types' do
      event_type = EventType.create! valid_attributes
      get :index
      expect(assigns(:event_types)).to eq([event_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested event_type as @event_type' do
      event_type = EventType.create! valid_attributes
      get :show, id: event_type.to_param
      expect(assigns(:event_type)).to eq(event_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new event_type as @event_type' do
      get :new
      expect(assigns(:event_type)).to be_a_new(EventType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested event_type as @event_type' do
      event_type = EventType.create! valid_attributes
      get :edit, id: event_type.to_param
      expect(assigns(:event_type)).to eq(event_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new EventType' do
        expect {
          post :create, event_type: valid_attributes
        }.to change(EventType, :count).by(1)
      end

      it 'assigns a newly created event_type as @event_type' do
        post :create, event_type: valid_attributes
        expect(assigns(:event_type)).to be_a(EventType)
        expect(assigns(:event_type)).to be_persisted
      end

      it 'redirects to the created event_type' do
        post :create, event_type: valid_attributes
        expect(response).to redirect_to(event_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved event_type as @event_type' do
        post :create, event_type: invalid_attributes
        expect(assigns(:event_type)).to be_a_new(EventType)
      end

      it 're-renders the "new" template' do
        post :create, event_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested event_type' do
        event_type = EventType.create! valid_attributes
        put :update, id: event_type.to_param, event_type: new_attributes
        event_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested event_type as @event_type' do
        event_type = EventType.create! valid_attributes
        put :update, id: event_type.to_param, event_type: valid_attributes
        expect(assigns(:event_type)).to eq(event_type)
      end

      it 'redirects to event_types' do
        event_type = EventType.create! valid_attributes
        put :update, id: event_type.to_param, event_type: valid_attributes
        expect(response).to redirect_to(event_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the event_type as @event_type' do
        event_type = EventType.create! valid_attributes
        put :update, id: event_type.to_param, event_type: invalid_attributes
        expect(assigns(:event_type)).to eq(event_type)
      end

      it 're-renders the "edit" template' do
        event_type = EventType.create! valid_attributes
        put :update, id: event_type.to_param, event_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested event_type' do
      event_type = EventType.create! valid_attributes
      expect {
        delete :destroy, id: event_type.to_param
      }.to change(EventType, :count).by(event_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the event_types list' do
      event_type = EventType.create! valid_attributes
      delete :destroy, id: event_type.to_param
      expect(response).to redirect_to(event_types_url)
    end
  end

end
