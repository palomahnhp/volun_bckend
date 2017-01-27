require 'rails_helper'

RSpec.describe Pro::IssuesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :issue
  }

  let(:invalid_attributes) {
    attributes_for :issue, :invalid
  }

  describe "GET #index" do
    it 'assigns all pro_issues as @pro_issues' do
      issue = Pro::Issue.create! valid_attributes
      get :index
      expect(assigns(:pro_issues)).to eq([issue])
    end
  end

  describe "GET #show" do
    it 'assigns the requested pro_issue as @pro_issue' do
      issue = Pro::Issue.create! valid_attributes
      get :show, id: issue.to_param
      expect(assigns(:pro_issue)).to eq(issue)
    end
  end

  describe "GET #new" do
    it 'assigns a new pro_issue as @pro_issue' do
      get :new
      expect(assigns(:pro_issue)).to be_a_new(Pro::Issue)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested pro_issue as @pro_issue' do
      issue = Pro::Issue.create! valid_attributes
      get :edit, id: issue.to_param
      expect(assigns(:pro_issue)).to eq(issue)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Pro::Issue' do
        expect {
          post :create, pro_issue: valid_attributes
        }.to change(Pro::Issue, :count).by(1)
      end

      it 'assigns a newly created pro_issue as @pro_issue' do
        post :create, pro_issue: valid_attributes
        expect(assigns(:pro_issue)).to be_a(Pro::Issue)
        expect(assigns(:pro_issue)).to be_persisted
      end

      it 'redirects to the created pro_issue' do
        post :create, pro_issue: valid_attributes
        expect(response).to redirect_to(pro_issues_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved pro_issue as @pro_issue' do
        post :create, pro_issue: invalid_attributes
        expect(assigns(:pro_issue)).to be_a_new(Pro::Issue)
      end

      it 're-renders the "new" template' do
        post :create, pro_issue: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested pro_issue' do
        issue = Pro::Issue.create! valid_attributes
        put :update, id: issue.to_param, pro_issue: new_attributes
        issue.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested pro_issue as @pro_issue' do
        issue = Pro::Issue.create! valid_attributes
        put :update, id: issue.to_param, pro_issue: valid_attributes
        expect(assigns(:pro_issue)).to eq(issue)
      end

      it 'redirects to pro_issues' do
        issue = Pro::Issue.create! valid_attributes
        put :update, id: issue.to_param, pro_issue: valid_attributes
        expect(response).to redirect_to(pro_issues_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the pro_issue as @pro_issue' do
        issue = Pro::Issue.create! valid_attributes
        put :update, id: issue.to_param, pro_issue: invalid_attributes
        expect(assigns(:pro_issue)).to eq(issue)
      end

      it 're-renders the "edit" template' do
        issue = Pro::Issue.create! valid_attributes
        put :update, id: issue.to_param, pro_issue: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested pro_issue' do
      issue = Pro::Issue.create! valid_attributes
      expect {
        delete :destroy, id: issue.to_param
      }.to change(Pro::Issue, :count).by(issue.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the pro_issues list' do
      issue = Pro::Issue.create! valid_attributes
      delete :destroy, id: issue.to_param
      expect(response).to redirect_to(pro_issues_url)
    end
  end

end
