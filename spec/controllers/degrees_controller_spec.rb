require 'rails_helper'

RSpec.describe DegreesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :degree
  }

  let(:invalid_attributes) {
    attributes_for :degree, :invalid
  }

  describe "GET #index" do
    it 'assigns all degrees as @degrees' do
      degree = Degree.create! valid_attributes
      get :index
      expect(assigns(:degrees)).to eq([degree])
    end
  end

  describe "GET #show" do
    it 'assigns the requested degree as @degree' do
      degree = Degree.create! valid_attributes
      get :show, id: degree.to_param
      expect(assigns(:degree)).to eq(degree)
    end
  end

  describe "GET #new" do
    it 'assigns a new degree as @degree' do
      get :new
      expect(assigns(:degree)).to be_a_new(Degree)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested degree as @degree' do
      degree = Degree.create! valid_attributes
      get :edit, id: degree.to_param
      expect(assigns(:degree)).to eq(degree)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Degree' do
        expect {
          post :create, degree: valid_attributes
        }.to change(Degree, :count).by(1)
      end

      it 'assigns a newly created degree as @degree' do
        post :create, degree: valid_attributes
        expect(assigns(:degree)).to be_a(Degree)
        expect(assigns(:degree)).to be_persisted
      end

      it 'redirects to the created degree' do
        post :create, degree: valid_attributes
        expect(response).to redirect_to(degrees_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved degree as @degree' do
        post :create, degree: invalid_attributes
        expect(assigns(:degree)).to be_a_new(Degree)
      end

      it 're-renders the "new" template' do
        post :create, degree: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested degree' do
        degree = Degree.create! valid_attributes
        put :update, id: degree.to_param, degree: new_attributes
        degree.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested degree as @degree' do
        degree = Degree.create! valid_attributes
        put :update, id: degree.to_param, degree: valid_attributes
        expect(assigns(:degree)).to eq(degree)
      end

      it 'redirects to degrees' do
        degree = Degree.create! valid_attributes
        put :update, id: degree.to_param, degree: valid_attributes
        expect(response).to redirect_to(degrees_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the degree as @degree' do
        degree = Degree.create! valid_attributes
        put :update, id: degree.to_param, degree: invalid_attributes
        expect(assigns(:degree)).to eq(degree)
      end

      it 're-renders the "edit" template' do
        degree = Degree.create! valid_attributes
        put :update, id: degree.to_param, degree: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested degree' do
      degree = Degree.create! valid_attributes
      expect {
        delete :destroy, id: degree.to_param
      }.to change(Degree, :count).by(degree.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the degrees list' do
      degree = Degree.create! valid_attributes
      delete :destroy, id: degree.to_param
      expect(response).to redirect_to(degrees_url)
    end
  end

end
