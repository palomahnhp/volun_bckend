require 'rails_helper'

RSpec.describe FrontpagePositionsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :frontpage_position
  }

  let(:invalid_attributes) {
    attributes_for :frontpage_position, :invalid
  }

  describe "GET #index" do
    it 'assigns all frontpage_positions as @frontpage_positions' do
      frontpage_position = FrontpagePosition.create! valid_attributes
      get :index
      expect(assigns(:frontpage_positions)).to eq([frontpage_position])
    end
  end

  describe "GET #show" do
    it 'assigns the requested frontpage_position as @frontpage_position' do
      frontpage_position = FrontpagePosition.create! valid_attributes
      get :show, id: frontpage_position.to_param
      expect(assigns(:frontpage_position)).to eq(frontpage_position)
    end
  end

  describe "GET #new" do
    it 'assigns a new frontpage_position as @frontpage_position' do
      get :new
      expect(assigns(:frontpage_position)).to be_a_new(FrontpagePosition)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested frontpage_position as @frontpage_position' do
      frontpage_position = FrontpagePosition.create! valid_attributes
      get :edit, id: frontpage_position.to_param
      expect(assigns(:frontpage_position)).to eq(frontpage_position)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new FrontpagePosition' do
        expect {
          post :create, frontpage_position: valid_attributes
        }.to change(FrontpagePosition, :count).by(1)
      end

      it 'assigns a newly created frontpage_position as @frontpage_position' do
        post :create, frontpage_position: valid_attributes
        expect(assigns(:frontpage_position)).to be_a(FrontpagePosition)
        expect(assigns(:frontpage_position)).to be_persisted
      end

      it 'redirects to the created frontpage_position' do
        post :create, frontpage_position: valid_attributes
        expect(response).to redirect_to(frontpage_positions_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved frontpage_position as @frontpage_position' do
        post :create, frontpage_position: invalid_attributes
        expect(assigns(:frontpage_position)).to be_a_new(FrontpagePosition)
      end

      it 're-renders the "new" template' do
        post :create, frontpage_position: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested frontpage_position' do
        frontpage_position = FrontpagePosition.create! valid_attributes
        put :update, id: frontpage_position.to_param, frontpage_position: new_attributes
        frontpage_position.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested frontpage_position as @frontpage_position' do
        frontpage_position = FrontpagePosition.create! valid_attributes
        put :update, id: frontpage_position.to_param, frontpage_position: valid_attributes
        expect(assigns(:frontpage_position)).to eq(frontpage_position)
      end

      it 'redirects to frontpage_positions' do
        frontpage_position = FrontpagePosition.create! valid_attributes
        put :update, id: frontpage_position.to_param, frontpage_position: valid_attributes
        expect(response).to redirect_to(frontpage_positions_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the frontpage_position as @frontpage_position' do
        frontpage_position = FrontpagePosition.create! valid_attributes
        put :update, id: frontpage_position.to_param, frontpage_position: invalid_attributes
        expect(assigns(:frontpage_position)).to eq(frontpage_position)
      end

      it 're-renders the "edit" template' do
        frontpage_position = FrontpagePosition.create! valid_attributes
        put :update, id: frontpage_position.to_param, frontpage_position: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested frontpage_position' do
      frontpage_position = FrontpagePosition.create! valid_attributes
      expect {
        delete :destroy, id: frontpage_position.to_param
      }.to change(FrontpagePosition, :count).by(frontpage_position.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the frontpage_positions list' do
      frontpage_position = FrontpagePosition.create! valid_attributes
      delete :destroy, id: frontpage_position.to_param
      expect(response).to redirect_to(frontpage_positions_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested frontpage_position' do
      frontpage_position = FrontpagePosition.create! valid_attributes
      delete :destroy, id: frontpage_position.to_param
      post :recover, id: frontpage_position.to_param
      expect(frontpage_position.active).to eq(true)
    end

    it 'redirects to the frontpage_positions list' do
      frontpage_position = FrontpagePosition.create! valid_attributes
      post :recover, id: frontpage_position.to_param
      expect(response).to redirect_to(frontpage_positions_url)
    end
  end

end
