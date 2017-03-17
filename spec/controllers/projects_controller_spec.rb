require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :project
  }

  let(:invalid_attributes) {
    attributes_for :project, :invalid
  }

  describe "GET #index" do
    it 'assigns all projects as @projects' do
      @entity = FactoryGirl.create(:entity)
      @project_type = FactoryGirl.create(:project_type)
      valid_attributes[:entity_id] = @entity.id
      valid_attributes[:project_type_id] = @project_type.id
      project = Project.create! valid_attributes
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "GET #show" do
    it 'assigns the requested project as @project' do
      @entity = FactoryGirl.create(:entity)
      @project_type = FactoryGirl.create(:project_type)
      valid_attributes[:entity_id] = @entity.id
      valid_attributes[:project_type_id] = @project_type.id
      project = Project.create! valid_attributes
      get :show, id: project.to_param
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "GET #new" do
    it 'assigns a new project as @project' do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested project as @project' do
      @entity = FactoryGirl.create(:entity)
      @project_type = FactoryGirl.create(:project_type)
      valid_attributes[:entity_id] = @entity.id
      valid_attributes[:project_type_id] = @project_type.id
      project = Project.create! valid_attributes
      get :edit, id: project.to_param
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Project' do
        expect {
          @entity = FactoryGirl.create(:entity)
          @project_type = FactoryGirl.create(:project_type)
          valid_attributes[:entity_id] = @entity.id
          valid_attributes[:project_type_id] = @project_type.id
          Project.create! valid_attributes
        }.to change(Project, :count).by(1)
      end

      it 'assigns a newly created project as @project' do
        @entity = FactoryGirl.create(:entity)
        @project_type = FactoryGirl.create(:project_type)
        valid_attributes[:entity_id] = @entity.id
        valid_attributes[:project_type_id] = @project_type.id
        post :create, project: valid_attributes
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end

      it 'redirects to the created project' do
        @entity = FactoryGirl.create(:entity)
        @project_type = FactoryGirl.create(:project_type)
        valid_attributes[:entity_id] = @entity.id
        valid_attributes[:project_type_id] = @project_type.id
        post :create, project: valid_attributes
        expect(response).to redirect_to(projects_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved project as @project' do
        post :create, project: invalid_attributes
        expect(assigns(:project)).to be_a_new(Project)
      end

      it 're-renders the "new" template' do
        post :create, project: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested project' do
        @entity = FactoryGirl.create(:entity)
        @project_type = FactoryGirl.create(:project_type)
        valid_attributes[:entity_id] = @entity.id
        valid_attributes[:project_type_id] = @project_type.id
        project = Project.create! valid_attributes
        put :update, id: project.to_param, project: new_attributes
        project.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested project as @project' do
        @entity = FactoryGirl.create(:entity)
        @project_type = FactoryGirl.create(:project_type)
        valid_attributes[:entity_id] = @entity.id
        valid_attributes[:project_type_id] = @project_type.id
        project = Project.create! valid_attributes
        put :update, id: project.to_param, project: valid_attributes
        expect(assigns(:project)).to eq(project)
      end

      it 'redirects to projects' do
        @entity = FactoryGirl.create(:entity)
        @project_type = FactoryGirl.create(:project_type)
        valid_attributes[:entity_id] = @entity.id
        valid_attributes[:project_type_id] = @project_type.id
        project = Project.create! valid_attributes
        put :update, id: project.to_param, project: valid_attributes
        expect(response).to redirect_to(projects_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the project as @project' do
        @entity = FactoryGirl.create(:entity)
        @project_type = FactoryGirl.create(:project_type)
        valid_attributes[:entity_id] = @entity.id
        valid_attributes[:project_type_id] = @project_type.id
        project = Project.create! valid_attributes
        put :update, id: project.to_param, project: invalid_attributes
        expect(assigns(:project)).to eq(project)
      end

      it 're-renders the "edit" template' do
        @entity = FactoryGirl.create(:entity)
        @project_type = FactoryGirl.create(:project_type)
        valid_attributes[:entity_id] = @entity.id
        valid_attributes[:project_type_id] = @project_type.id
        project = Project.create! valid_attributes
        put :update, id: project.to_param, project: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested project' do
      @entity = FactoryGirl.create(:entity)
      @project_type = FactoryGirl.create(:project_type)
      valid_attributes[:entity_id] = @entity.id
      valid_attributes[:project_type_id] = @project_type.id
      project = Project.create! valid_attributes
      expect {
        delete :destroy, id: project.to_param
      }.to change(Project, :count).by(project.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the projects list' do
      @entity = FactoryGirl.create(:entity)
      @project_type = FactoryGirl.create(:project_type)
      valid_attributes[:entity_id] = @entity.id
      valid_attributes[:project_type_id] = @project_type.id
      project = Project.create! valid_attributes
      delete :destroy, id: project.to_param
      expect(response).to redirect_to(projects_url)
    end
  end

end
