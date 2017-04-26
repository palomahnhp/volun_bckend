class SkillsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Skill.ransack_default
    @search_q = @skills.search(params[:q])
    @skills = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@skills)
  end

  def show
    respond_with(@skill) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @skill = Skill.new
    respond_with(@skill)
  end

  def edit
  end

  def create
    @skill.save
    respond_with(@skill)
  end

  def update
    @skill.update_attributes(skill_params)
    respond_with(@skill)
  end

  def destroy
    @skill.destroy
    respond_with(@skill)
  end

  def recover
    @skill.recover
    respond_with(@skill)
  end

  protected

    def skill_params
      params.require(:skill).permit(:name, :active)
    end
end
