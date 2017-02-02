require 'rails_helper'

RSpec.describe NationalitiesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :nationality
  }

  let(:invalid_attributes) {
    attributes_for :nationality, :invalid
  }

  describe "GET #index" do
    it 'assigns all nationalities as @nationalities' do
      nationality = Nationality.create! valid_attributes
      get :index
      expect(assigns(:nationalities)).to eq([nationality])
    end
  end

  describe "GET #show" do
    it 'assigns the requested nationality as @nationality' do
      nationality = Nationality.create! valid_attributes
      get :show, id: nationality.to_param
      expect(assigns(:nationality)).to eq(nationality)
    end
  end

  describe "GET #new" do
    it 'assigns a new nationality as @nationality' do
      get :new
      expect(assigns(:nationality)).to be_a_new(Nationality)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested nationality as @nationality' do
      nationality = Nationality.create! valid_attributes
      get :edit, id: nationality.to_param
      expect(assigns(:nationality)).to eq(nationality)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Nationality' do
        expect {
          post :create, nationality: valid_attributes
        }.to change(Nationality, :count).by(1)
      end

      it 'assigns a newly created nationality as @nationality' do
        post :create, nationality: valid_attributes
        expect(assigns(:nationality)).to be_a(Nationality)
        expect(assigns(:nationality)).to be_persisted
      end

      it 'redirects to the created nationality' do
        post :create, nationality: valid_attributes
        expect(response).to redirect_to(nationalities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved nationality as @nationality' do
        post :create, nationality: invalid_attributes
        expect(assigns(:nationality)).to be_a_new(Nationality)
      end

      it 're-renders the "new" template' do
        post :create, nationality: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested nationality' do
        nationality = Nationality.create! valid_attributes
        put :update, id: nationality.to_param, nationality: new_attributes
        nationality.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested nationality as @nationality' do
        nationality = Nationality.create! valid_attributes
        put :update, id: nationality.to_param, nationality: valid_attributes
        expect(assigns(:nationality)).to eq(nationality)
      end

      it 'redirects to nationalities' do
        nationality = Nationality.create! valid_attributes
        put :update, id: nationality.to_param, nationality: valid_attributes
        expect(response).to redirect_to(nationalities_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the nationality as @nationality' do
        nationality = Nationality.create! valid_attributes
        put :update, id: nationality.to_param, nationality: invalid_attributes
        expect(assigns(:nationality)).to eq(nationality)
      end

      it 're-renders the "edit" template' do
        nationality = Nationality.create! valid_attributes
        put :update, id: nationality.to_param, nationality: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested nationality' do
      nationality = Nationality.create! valid_attributes
      expect {
        delete :destroy, id: nationality.to_param
      }.to change(Nationality, :count).by(nationality.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the nationalities list' do
      nationality = Nationality.create! valid_attributes
      delete :destroy, id: nationality.to_param
      expect(response).to redirect_to(nationalities_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested nationality' do
      nationality = Nationality.create! valid_attributes
      delete :destroy, id: nationality.to_param
      post :recover, id: nationality.to_param
      expect(nationality.active).to eq(true)
    end

    it 'redirects to the nationalities list' do
      nationality = Nationality.create! valid_attributes
      post :recover, id: nationality.to_param
      expect(response).to redirect_to(nationalities_url)
    end
  end

end
