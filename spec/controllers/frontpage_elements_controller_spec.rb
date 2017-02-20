require 'rails_helper'

RSpec.describe FrontpageElementsController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  let(:valid_attributes) {
    attributes_for :frontpage_element
  }

  let(:invalid_attributes) {
    attributes_for :frontpage_element, :invalid
  }

  describe "GET #index" do
    it 'assigns all frontpage_elements as @frontpage_elements' do
      @frontpage_position = FactoryGirl.create(:frontpage_position)
      valid_attributes[:frontpage_position_id] = @frontpage_position.id
      valid_attributes[:created_by] = @user.id
      frontpage_element = FrontpageElement.create! valid_attributes
      get :index
      expect(assigns(:frontpage_elements)).to eq([frontpage_element])
    end
  end

  describe "GET #show" do
    it 'assigns the requested frontpage_element as @frontpage_element' do
      @frontpage_position = FactoryGirl.create(:frontpage_position)
      valid_attributes[:frontpage_position_id] = @frontpage_position.id
      valid_attributes[:created_by] = @user.id
      frontpage_element = FrontpageElement.create! valid_attributes
      get :show, id: frontpage_element.to_param
      expect(assigns(:frontpage_element)).to eq(frontpage_element)
    end
  end

  describe "GET #new" do
    it 'assigns a new frontpage_element as @frontpage_element' do
      get :new
      expect(assigns(:frontpage_element)).to be_a_new(FrontpageElement)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested frontpage_element as @frontpage_element' do
      @frontpage_position = FactoryGirl.create(:frontpage_position)
      valid_attributes[:frontpage_position_id] = @frontpage_position.id
      valid_attributes[:created_by] = @user.id
      frontpage_element = FrontpageElement.create! valid_attributes
      get :edit, id: frontpage_element.to_param
      expect(assigns(:frontpage_element)).to eq(frontpage_element)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new FrontpageElement' do
        expect {
          @frontpage_position = FactoryGirl.create(:frontpage_position)
          valid_attributes[:frontpage_position_id] = @frontpage_position.id
          valid_attributes[:created_by] = @user.id
          frontpage_element = FrontpageElement.create! valid_attributes
          post :create, frontpage_element: valid_attributes
        }.to change(FrontpageElement, :count).by(1)
      end

      it 'assigns a newly created frontpage_element as @frontpage_element' do
        @frontpage_position = FactoryGirl.create(:frontpage_position)
        valid_attributes[:frontpage_position_id] = @frontpage_position.id
        valid_attributes[:created_by] = @user.id
        post :create, frontpage_element: valid_attributes
        expect(assigns(:frontpage_element)).to be_a(FrontpageElement)
        expect(assigns(:frontpage_element)).to be_persisted
      end

      it 'redirects to the created frontpage_element' do
        @frontpage_position = FactoryGirl.create(:frontpage_position)
        valid_attributes[:frontpage_position_id] = @frontpage_position.id
        valid_attributes[:created_by] = @user.id
        post :create, frontpage_element: valid_attributes
        expect(response).to redirect_to(frontpage_elements_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved frontpage_element as @frontpage_element' do
        post :create, frontpage_element: invalid_attributes
        expect(assigns(:frontpage_element)).to be_a_new(FrontpageElement)
      end

      it 're-renders the "new" template' do
        post :create, frontpage_element: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested frontpage_element' do
        @frontpage_position = FactoryGirl.create(:frontpage_position)
        valid_attributes[:frontpage_position_id] = @frontpage_position.id
        valid_attributes[:created_by] = @user.id
        frontpage_element = FrontpageElement.create! valid_attributes
        put :update, id: frontpage_element.to_param, frontpage_element: new_attributes
        frontpage_element.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested frontpage_element as @frontpage_element' do
        @frontpage_position = FactoryGirl.create(:frontpage_position)
        valid_attributes[:frontpage_position_id] = @frontpage_position.id
        valid_attributes[:created_by] = @user.id
        frontpage_element = FrontpageElement.create! valid_attributes
        put :update, id: frontpage_element.to_param, frontpage_element: valid_attributes
        expect(assigns(:frontpage_element)).to eq(frontpage_element)
      end

      it 'redirects to frontpage_elements' do
        @frontpage_position = FactoryGirl.create(:frontpage_position)
        valid_attributes[:frontpage_position_id] = @frontpage_position.id
        valid_attributes[:created_by] = @user.id
        frontpage_element = FrontpageElement.create! valid_attributes
        put :update, id: frontpage_element.to_param, frontpage_element: valid_attributes
        expect(response).to redirect_to(frontpage_elements_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the frontpage_element as @frontpage_element' do
        @frontpage_position = FactoryGirl.create(:frontpage_position)
        valid_attributes[:frontpage_position_id] = @frontpage_position.id
        valid_attributes[:created_by] = @user.id
        frontpage_element = FrontpageElement.create! valid_attributes
        put :update, id: frontpage_element.to_param, frontpage_element: invalid_attributes
        expect(assigns(:frontpage_element)).to eq(frontpage_element)
      end

      it 're-renders the "edit" template' do
        @frontpage_position = FactoryGirl.create(:frontpage_position)
        valid_attributes[:frontpage_position_id] = @frontpage_position.id
        valid_attributes[:created_by] = @user.id
        frontpage_element = FrontpageElement.create! valid_attributes
        put :update, id: frontpage_element.to_param, frontpage_element: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested frontpage_element' do
      @frontpage_position = FactoryGirl.create(:frontpage_position)
      valid_attributes[:frontpage_position_id] = @frontpage_position.id
      valid_attributes[:created_by] = @user.id
      frontpage_element = FrontpageElement.create! valid_attributes
      expect {
        delete :destroy, id: frontpage_element.to_param
      }.to change(FrontpageElement, :count).by(frontpage_element.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the frontpage_elements list' do
      @frontpage_position = FactoryGirl.create(:frontpage_position)
      valid_attributes[:frontpage_position_id] = @frontpage_position.id
      valid_attributes[:created_by] = @user.id
      frontpage_element = FrontpageElement.create! valid_attributes
      delete :destroy, id: frontpage_element.to_param
      expect(response).to redirect_to(frontpage_elements_url)
    end
  end
  
  describe "RECOVER #recover" do
    it 'recovers the requested frontpage_element' do
      @frontpage_position = FactoryGirl.create(:frontpage_position)
      valid_attributes[:frontpage_position_id] = @frontpage_position.id
      valid_attributes[:created_by] = @user.id
      frontpage_element = FrontpageElement.create! valid_attributes
      delete :destroy, id: frontpage_element.to_param
      post :recover, id: frontpage_element.to_param
      expect(frontpage_element.active).to eq(true)
    end

    it 'redirects to the frontpage_elements list' do
      @frontpage_position = FactoryGirl.create(:frontpage_position)
      valid_attributes[:frontpage_position_id] = @frontpage_position.id
      valid_attributes[:created_by] = @user.id
      frontpage_element = FrontpageElement.create! valid_attributes
      post :recover, id: frontpage_element.to_param
      expect(response).to redirect_to(frontpage_elements_url)
    end
  end

end
