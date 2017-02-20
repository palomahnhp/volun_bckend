require 'rails_helper'

RSpec.describe SkillsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :skill
  }

  let(:invalid_attributes) {
    attributes_for :skill, :invalid
  }

  describe "GET #index" do
    it 'assigns all skills as @skills' do
      skill = Skill.create! valid_attributes
      get :index
      expect(assigns(:skills)).to eq([skill])
    end
  end

  describe "GET #show" do
    it 'assigns the requested skill as @skill' do
      skill = Skill.create! valid_attributes
      get :show, id: skill.to_param
      expect(assigns(:skill)).to eq(skill)
    end
  end

  describe "GET #new" do
    it 'assigns a new skill as @skill' do
      get :new
      expect(assigns(:skill)).to be_a_new(Skill)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested skill as @skill' do
      skill = Skill.create! valid_attributes
      get :edit, id: skill.to_param
      expect(assigns(:skill)).to eq(skill)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Skill' do
        expect {
          post :create, skill: valid_attributes
        }.to change(Skill, :count).by(1)
      end

      it 'assigns a newly created skill as @skill' do
        post :create, skill: valid_attributes
        expect(assigns(:skill)).to be_a(Skill)
        expect(assigns(:skill)).to be_persisted
      end

      it 'redirects to the created skill' do
        post :create, skill: valid_attributes
        expect(response).to redirect_to(skills_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved skill as @skill' do
        post :create, skill: invalid_attributes
        expect(assigns(:skill)).to be_a_new(Skill)
      end

      it 're-renders the "new" template' do
        post :create, skill: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested skill' do
        skill = Skill.create! valid_attributes
        put :update, id: skill.to_param, skill: new_attributes
        skill.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested skill as @skill' do
        skill = Skill.create! valid_attributes
        put :update, id: skill.to_param, skill: valid_attributes
        expect(assigns(:skill)).to eq(skill)
      end

      it 'redirects to skills' do
        skill = Skill.create! valid_attributes
        put :update, id: skill.to_param, skill: valid_attributes
        expect(response).to redirect_to(skills_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the skill as @skill' do
        skill = Skill.create! valid_attributes
        put :update, id: skill.to_param, skill: invalid_attributes
        expect(assigns(:skill)).to eq(skill)
      end

      it 're-renders the "edit" template' do
        skill = Skill.create! valid_attributes
        put :update, id: skill.to_param, skill: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested skill' do
      skill = Skill.create! valid_attributes
      expect {
        delete :destroy, id: skill.to_param
      }.to change(Skill, :count).by(skill.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the skills list' do
      skill = Skill.create! valid_attributes
      delete :destroy, id: skill.to_param
      expect(response).to redirect_to(skills_url)
    end
  end

end
