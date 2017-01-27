require 'rails_helper'

RSpec.describe ProposalsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :proposal
  }

  let(:invalid_attributes) {
    attributes_for :proposal, :invalid
  }

  describe "GET #index" do
    it 'assigns all proposals as @proposals' do
      proposal = Proposal.create! valid_attributes
      get :index
      expect(assigns(:proposals)).to eq([proposal])
    end
  end

  describe "GET #show" do
    it 'assigns the requested proposal as @proposal' do
      proposal = Proposal.create! valid_attributes
      get :show, id: proposal.to_param
      expect(assigns(:proposal)).to eq(proposal)
    end
  end

  describe "GET #new" do
    it 'assigns a new proposal as @proposal' do
      get :new
      expect(assigns(:proposal)).to be_a_new(Proposal)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested proposal as @proposal' do
      proposal = Proposal.create! valid_attributes
      get :edit, id: proposal.to_param
      expect(assigns(:proposal)).to eq(proposal)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Proposal' do
        expect {
          post :create, proposal: valid_attributes
        }.to change(Proposal, :count).by(1)
      end

      it 'assigns a newly created proposal as @proposal' do
        post :create, proposal: valid_attributes
        expect(assigns(:proposal)).to be_a(Proposal)
        expect(assigns(:proposal)).to be_persisted
      end

      it 'redirects to the created proposal' do
        post :create, proposal: valid_attributes
        expect(response).to redirect_to(proposals_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved proposal as @proposal' do
        post :create, proposal: invalid_attributes
        expect(assigns(:proposal)).to be_a_new(Proposal)
      end

      it 're-renders the "new" template' do
        post :create, proposal: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested proposal' do
        proposal = Proposal.create! valid_attributes
        put :update, id: proposal.to_param, proposal: new_attributes
        proposal.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested proposal as @proposal' do
        proposal = Proposal.create! valid_attributes
        put :update, id: proposal.to_param, proposal: valid_attributes
        expect(assigns(:proposal)).to eq(proposal)
      end

      it 'redirects to proposals' do
        proposal = Proposal.create! valid_attributes
        put :update, id: proposal.to_param, proposal: valid_attributes
        expect(response).to redirect_to(proposals_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the proposal as @proposal' do
        proposal = Proposal.create! valid_attributes
        put :update, id: proposal.to_param, proposal: invalid_attributes
        expect(assigns(:proposal)).to eq(proposal)
      end

      it 're-renders the "edit" template' do
        proposal = Proposal.create! valid_attributes
        put :update, id: proposal.to_param, proposal: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested proposal' do
      proposal = Proposal.create! valid_attributes
      expect {
        delete :destroy, id: proposal.to_param
      }.to change(Proposal, :count).by(proposal.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the proposals list' do
      proposal = Proposal.create! valid_attributes
      delete :destroy, id: proposal.to_param
      expect(response).to redirect_to(proposals_url)
    end
  end

end
