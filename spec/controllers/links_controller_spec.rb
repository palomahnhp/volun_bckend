require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :link
  }

  let(:invalid_attributes) {
    attributes_for :link, :invalid
  }

  describe "GET #index" do
    it 'assigns all links as @links' do
      link = Link.create! valid_attributes
      get :index
      expect(assigns(:links)).to eq([link])
    end
  end

  describe "GET #show" do
    it 'assigns the requested link as @link' do
      link = Link.create! valid_attributes
      get :show, id: link.to_param
      expect(assigns(:link)).to eq(link)
    end
  end

  describe "GET #new" do
    it 'assigns a new link as @link' do
      get :new
      expect(assigns(:link)).to be_a_new(Link)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested link as @link' do
      link = Link.create! valid_attributes
      get :edit, id: link.to_param
      expect(assigns(:link)).to eq(link)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Link' do
        expect {
          post :create, link: valid_attributes
        }.to change(Link, :count).by(1)
      end

      it 'assigns a newly created link as @link' do
        post :create, link: valid_attributes
        expect(assigns(:link)).to be_a(Link)
        expect(assigns(:link)).to be_persisted
      end

      it 'redirects to the created link' do
        post :create, link: valid_attributes
        expect(response).to redirect_to(links_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved link as @link' do
        post :create, link: invalid_attributes
        expect(assigns(:link)).to be_a_new(Link)
      end

      it 're-renders the "new" template' do
        post :create, link: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested link' do
        link = Link.create! valid_attributes
        put :update, id: link.to_param, link: new_attributes
        link.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested link as @link' do
        link = Link.create! valid_attributes
        put :update, id: link.to_param, link: valid_attributes
        expect(assigns(:link)).to eq(link)
      end

      it 'redirects to links' do
        link = Link.create! valid_attributes
        put :update, id: link.to_param, link: valid_attributes
        expect(response).to redirect_to(links_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the link as @link' do
        link = Link.create! valid_attributes
        put :update, id: link.to_param, link: invalid_attributes
        expect(assigns(:link)).to eq(link)
      end

      it 're-renders the "edit" template' do
        link = Link.create! valid_attributes
        put :update, id: link.to_param, link: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested link' do
      link = Link.create! valid_attributes
      expect {
        delete :destroy, id: link.to_param
      }.to change(Link, :count).by(link.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the links list' do
      link = Link.create! valid_attributes
      delete :destroy, id: link.to_param
      expect(response).to redirect_to(links_url)
    end
  end

end
