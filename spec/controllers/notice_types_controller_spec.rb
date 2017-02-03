require 'rails_helper'

RSpec.describe NoticeTypesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :notice_type
  }

  let(:invalid_attributes) {
    attributes_for :notice_type, :invalid
  }

  describe "GET #index" do
    it 'assigns all notice_types as @notice_types' do
      notice_type = NoticeType.create! valid_attributes
      get :index
      expect(assigns(:notice_types)).to eq([notice_type])
    end
  end

  describe "GET #show" do
    it 'assigns the requested notice_type as @notice_type' do
      notice_type = NoticeType.create! valid_attributes
      get :show, id: notice_type.to_param
      expect(assigns(:notice_type)).to eq(notice_type)
    end
  end

  describe "GET #new" do
    it 'assigns a new notice_type as @notice_type' do
      get :new
      expect(assigns(:notice_type)).to be_a_new(NoticeType)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested notice_type as @notice_type' do
      notice_type = NoticeType.create! valid_attributes
      get :edit, id: notice_type.to_param
      expect(assigns(:notice_type)).to eq(notice_type)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new NoticeType' do
        expect {
          post :create, notice_type: valid_attributes
        }.to change(NoticeType, :count).by(1)
      end

      it 'assigns a newly created notice_type as @notice_type' do
        post :create, notice_type: valid_attributes
        expect(assigns(:notice_type)).to be_a(NoticeType)
        expect(assigns(:notice_type)).to be_persisted
      end

      it 'redirects to the created notice_type' do
        post :create, notice_type: valid_attributes
        expect(response).to redirect_to(notice_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved notice_type as @notice_type' do
        post :create, notice_type: invalid_attributes
        expect(assigns(:notice_type)).to be_a_new(NoticeType)
      end

      it 're-renders the "new" template' do
        post :create, notice_type: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested notice_type' do
        notice_type = NoticeType.create! valid_attributes
        put :update, id: notice_type.to_param, notice_type: new_attributes
        notice_type.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested notice_type as @notice_type' do
        notice_type = NoticeType.create! valid_attributes
        put :update, id: notice_type.to_param, notice_type: valid_attributes
        expect(assigns(:notice_type)).to eq(notice_type)
      end

      it 'redirects to notice_types' do
        notice_type = NoticeType.create! valid_attributes
        put :update, id: notice_type.to_param, notice_type: valid_attributes
        expect(response).to redirect_to(notice_types_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the notice_type as @notice_type' do
        notice_type = NoticeType.create! valid_attributes
        put :update, id: notice_type.to_param, notice_type: invalid_attributes
        expect(assigns(:notice_type)).to eq(notice_type)
      end

      it 're-renders the "edit" template' do
        notice_type = NoticeType.create! valid_attributes
        put :update, id: notice_type.to_param, notice_type: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested notice_type' do
      notice_type = NoticeType.create! valid_attributes
      expect {
        delete :destroy, id: notice_type.to_param
      }.to change(NoticeType, :count).by(notice_type.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the notice_types list' do
      notice_type = NoticeType.create! valid_attributes
      delete :destroy, id: notice_type.to_param
      expect(response).to redirect_to(notice_types_url)
    end
  end

end
