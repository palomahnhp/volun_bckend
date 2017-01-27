require 'rails_helper'

RSpec.describe SectorsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :sector
  }

  let(:invalid_attributes) {
    attributes_for :sector, :invalid
  }

  describe "GET #index" do
    it 'assigns all sectors as @sectors' do
      sector = Sector.create! valid_attributes
      get :index
      expect(assigns(:sectors)).to eq([sector])
    end
  end

  describe "GET #show" do
    it 'assigns the requested sector as @sector' do
      sector = Sector.create! valid_attributes
      get :show, id: sector.to_param
      expect(assigns(:sector)).to eq(sector)
    end
  end

  describe "GET #new" do
    it 'assigns a new sector as @sector' do
      get :new
      expect(assigns(:sector)).to be_a_new(Sector)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested sector as @sector' do
      sector = Sector.create! valid_attributes
      get :edit, id: sector.to_param
      expect(assigns(:sector)).to eq(sector)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Sector' do
        expect {
          post :create, sector: valid_attributes
        }.to change(Sector, :count).by(1)
      end

      it 'assigns a newly created sector as @sector' do
        post :create, sector: valid_attributes
        expect(assigns(:sector)).to be_a(Sector)
        expect(assigns(:sector)).to be_persisted
      end

      it 'redirects to the created sector' do
        post :create, sector: valid_attributes
        expect(response).to redirect_to(sectors_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved sector as @sector' do
        post :create, sector: invalid_attributes
        expect(assigns(:sector)).to be_a_new(Sector)
      end

      it 're-renders the "new" template' do
        post :create, sector: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested sector' do
        sector = Sector.create! valid_attributes
        put :update, id: sector.to_param, sector: new_attributes
        sector.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested sector as @sector' do
        sector = Sector.create! valid_attributes
        put :update, id: sector.to_param, sector: valid_attributes
        expect(assigns(:sector)).to eq(sector)
      end

      it 'redirects to sectors' do
        sector = Sector.create! valid_attributes
        put :update, id: sector.to_param, sector: valid_attributes
        expect(response).to redirect_to(sectors_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the sector as @sector' do
        sector = Sector.create! valid_attributes
        put :update, id: sector.to_param, sector: invalid_attributes
        expect(assigns(:sector)).to eq(sector)
      end

      it 're-renders the "edit" template' do
        sector = Sector.create! valid_attributes
        put :update, id: sector.to_param, sector: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested sector' do
      sector = Sector.create! valid_attributes
      expect {
        delete :destroy, id: sector.to_param
      }.to change(Sector, :count).by(sector.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the sectors list' do
      sector = Sector.create! valid_attributes
      delete :destroy, id: sector.to_param
      expect(response).to redirect_to(sectors_url)
    end
  end

end
