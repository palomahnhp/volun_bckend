require 'rails_helper'

RSpec.describe ProfessionsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :profession
  }

  let(:invalid_attributes) {
    attributes_for :profession, :invalid
  }

  describe "GET #index" do
    it 'assigns all professions as @professions' do
      profession = Profession.create! valid_attributes
      get :index
      expect(assigns(:professions)).to eq([profession])
    end
  end

  describe "GET #show" do
    it 'assigns the requested profession as @profession' do
      profession = Profession.create! valid_attributes
      get :show, id: profession.to_param
      expect(assigns(:profession)).to eq(profession)
    end
  end

  describe "GET #new" do
    it 'assigns a new profession as @profession' do
      get :new
      expect(assigns(:profession)).to be_a_new(Profession)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested profession as @profession' do
      profession = Profession.create! valid_attributes
      get :edit, id: profession.to_param
      expect(assigns(:profession)).to eq(profession)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Profession' do
        expect {
          post :create, profession: valid_attributes
        }.to change(Profession, :count).by(1)
      end

      it 'assigns a newly created profession as @profession' do
        post :create, profession: valid_attributes
        expect(assigns(:profession)).to be_a(Profession)
        expect(assigns(:profession)).to be_persisted
      end

      it 'redirects to the created profession' do
        post :create, profession: valid_attributes
        expect(response).to redirect_to(professions_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved profession as @profession' do
        post :create, profession: invalid_attributes
        expect(assigns(:profession)).to be_a_new(Profession)
      end

      it 're-renders the "new" template' do
        post :create, profession: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested profession' do
        profession = Profession.create! valid_attributes
        put :update, id: profession.to_param, profession: new_attributes
        profession.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested profession as @profession' do
        profession = Profession.create! valid_attributes
        put :update, id: profession.to_param, profession: valid_attributes
        expect(assigns(:profession)).to eq(profession)
      end

      it 'redirects to professions' do
        profession = Profession.create! valid_attributes
        put :update, id: profession.to_param, profession: valid_attributes
        expect(response).to redirect_to(professions_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the profession as @profession' do
        profession = Profession.create! valid_attributes
        put :update, id: profession.to_param, profession: invalid_attributes
        expect(assigns(:profession)).to eq(profession)
      end

      it 're-renders the "edit" template' do
        profession = Profession.create! valid_attributes
        put :update, id: profession.to_param, profession: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested profession' do
      profession = Profession.create! valid_attributes
      expect {
        delete :destroy, id: profession.to_param
      }.to change(Profession, :count).by(profession.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the professions list' do
      profession = Profession.create! valid_attributes
      delete :destroy, id: profession.to_param
      expect(response).to redirect_to(professions_url)
    end
  end

end
