require 'rails_helper'

RSpec.describe Volun::AssessmentsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :assessment
  }

  let(:invalid_attributes) {
    attributes_for :assessment, :invalid
  }

  describe "GET #index" do
    it 'assigns all volun_assessments as @volun_assessments' do
      assessment = Volun::Assessment.create! valid_attributes
      get :index
      expect(assigns(:volun_assessments)).to eq([assessment])
    end
  end

  describe "GET #show" do
    it 'assigns the requested volun_assessment as @volun_assessment' do
      assessment = Volun::Assessment.create! valid_attributes
      get :show, id: assessment.to_param
      expect(assigns(:volun_assessment)).to eq(assessment)
    end
  end

  describe "GET #new" do
    it 'assigns a new volun_assessment as @volun_assessment' do
      get :new
      expect(assigns(:volun_assessment)).to be_a_new(Volun::Assessment)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested volun_assessment as @volun_assessment' do
      assessment = Volun::Assessment.create! valid_attributes
      get :edit, id: assessment.to_param
      expect(assigns(:volun_assessment)).to eq(assessment)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Volun::Assessment' do
        expect {
          post :create, volun_assessment: valid_attributes
        }.to change(Volun::Assessment, :count).by(1)
      end

      it 'assigns a newly created volun_assessment as @volun_assessment' do
        post :create, volun_assessment: valid_attributes
        expect(assigns(:volun_assessment)).to be_a(Volun::Assessment)
        expect(assigns(:volun_assessment)).to be_persisted
      end

      it 'redirects to the created volun_assessment' do
        post :create, volun_assessment: valid_attributes
        expect(response).to redirect_to(volun_assessments_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved volun_assessment as @volun_assessment' do
        post :create, volun_assessment: invalid_attributes
        expect(assigns(:volun_assessment)).to be_a_new(Volun::Assessment)
      end

      it 're-renders the "new" template' do
        post :create, volun_assessment: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested volun_assessment' do
        assessment = Volun::Assessment.create! valid_attributes
        put :update, id: assessment.to_param, volun_assessment: new_attributes
        assessment.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested volun_assessment as @volun_assessment' do
        assessment = Volun::Assessment.create! valid_attributes
        put :update, id: assessment.to_param, volun_assessment: valid_attributes
        expect(assigns(:volun_assessment)).to eq(assessment)
      end

      it 'redirects to volun_assessments' do
        assessment = Volun::Assessment.create! valid_attributes
        put :update, id: assessment.to_param, volun_assessment: valid_attributes
        expect(response).to redirect_to(volun_assessments_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the volun_assessment as @volun_assessment' do
        assessment = Volun::Assessment.create! valid_attributes
        put :update, id: assessment.to_param, volun_assessment: invalid_attributes
        expect(assigns(:volun_assessment)).to eq(assessment)
      end

      it 're-renders the "edit" template' do
        assessment = Volun::Assessment.create! valid_attributes
        put :update, id: assessment.to_param, volun_assessment: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested volun_assessment' do
      assessment = Volun::Assessment.create! valid_attributes
      expect {
        delete :destroy, id: assessment.to_param
      }.to change(Volun::Assessment, :count).by(assessment.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the volun_assessments list' do
      assessment = Volun::Assessment.create! valid_attributes
      delete :destroy, id: assessment.to_param
      expect(response).to redirect_to(volun_assessments_url)
    end
  end

end
