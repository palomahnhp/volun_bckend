class Pro::IssuesController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= ProIssue.ransack_default
    @search_q = @pro_issues.search(params[:q])
    @pro_issues = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@pro_issues)
  end

  def show
    respond_with(@pro_issue) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @pro_issue = Pro::Issue.new
    respond_with(@pro_issue)
  end

  def edit
  end

  def create
    @pro_issue.save
    respond_with(@pro_issue)
  end

  def update
    @pro_issue.update_attributes(pro_issue_params)
    respond_with(@pro_issue)
  end

  def destroy
    @pro_issue.destroy
    respond_with(@pro_issue)
  end

  protected

    def pro_issue_params
      params.require(:pro_issue).permit(:comments, :start_date, :project_id)
    end
end
