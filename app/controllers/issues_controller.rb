class IssuesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Issue.ransack_default
    @search_q = @issues.search(params[:q])
    @issues = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@issues)
  end

  def show
    respond_with(@issue) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @issue = Issue.new
    respond_with(@issue)
  end

  def edit
  end

  def create
    @issue.save
    respond_with(@issue)
  end

  def update
    @issue.update_attributes(issue_params)
    respond_with(@issue)
  end

  def destroy
    @issue.destroy
    respond_with(@issue)
  end

  protected

    def issue_params
      params.require(:issue).permit(:comments, :start_date, :project_id)
    end
end
