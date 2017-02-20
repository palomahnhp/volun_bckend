require 'rails_helper'

RSpec.describe RequestFormsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :request_form
  }

  let(:invalid_attributes) {
    attributes_for :request_form, :invalid
  }

  describe "GET #index" do
    it 'assigns all request_forms as @request_forms' do
      request_form = RequestForm.create! valid_attributes
      get :index
      expect(assigns(:request_forms)).to eq([request_form])
    end
  end

  describe "GET #show" do
    it 'assigns the requested request_form as @request_form' do
      request_form = RequestForm.create! valid_attributes
      get :show, id: request_form.to_param
      expect(assigns(:request_form)).to eq(request_form)
    end
  end

  describe "GET #new" do
    it 'assigns a new request_form as @request_form' do
      get :new
      expect(assigns(:request_form)).to be_a_new(RequestForm)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested request_form as @request_form' do
      request_form = RequestForm.create! valid_attributes
      get :edit, id: request_form.to_param
      expect(assigns(:request_form)).to eq(request_form)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new RequestForm' do
        expect {
          post :create, request_form: valid_attributes
        }.to change(RequestForm, :count).by(1)
      end

      it 'assigns a newly created request_form as @request_form' do
        post :create, request_form: valid_attributes
        expect(assigns(:request_form)).to be_a(RequestForm)
        expect(assigns(:request_form)).to be_persisted
      end

      it 'redirects to the created request_form' do
        post :create, request_form: valid_attributes
        expect(response).to redirect_to(request_forms_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved request_form as @request_form' do
        post :create, request_form: invalid_attributes
        expect(assigns(:request_form)).to be_a_new(RequestForm)
      end

      it 're-renders the "new" template' do
        post :create, request_form: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested request_form' do
        request_form = RequestForm.create! valid_attributes
        put :update, id: request_form.to_param, request_form: new_attributes
        request_form.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested request_form as @request_form' do
        request_form = RequestForm.create! valid_attributes
        put :update, id: request_form.to_param, request_form: valid_attributes
        expect(assigns(:request_form)).to eq(request_form)
      end

      it 'redirects to request_forms' do
        request_form = RequestForm.create! valid_attributes
        put :update, id: request_form.to_param, request_form: valid_attributes
        expect(response).to redirect_to(request_forms_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the request_form as @request_form' do
        request_form = RequestForm.create! valid_attributes
        put :update, id: request_form.to_param, request_form: invalid_attributes
        expect(assigns(:request_form)).to eq(request_form)
      end

      it 're-renders the "edit" template' do
        request_form = RequestForm.create! valid_attributes
        put :update, id: request_form.to_param, request_form: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested request_form' do
      request_form = RequestForm.create! valid_attributes
      expect {
        delete :destroy, id: request_form.to_param
      }.to change(RequestForm, :count).by(request_form.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the request_forms list' do
      request_form = RequestForm.create! valid_attributes
      delete :destroy, id: request_form.to_param
      expect(response).to redirect_to(request_forms_url)
    end
  end

end
