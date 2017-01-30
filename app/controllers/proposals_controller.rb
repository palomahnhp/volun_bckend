class ProposalsController < ApplicationController

  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    params[:q] ||= Proposal.ransack_default
    @search_q = @proposals.search(params[:q])
    @proposals = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@proposals)
  end

  def show
    respond_with(@proposal) do |format|
      format.js { render 'shared/popup' }
      format.html
    end
  end

  def new
    @proposal = Proposal.new
    respond_with(@proposal)
  end

  def edit
  end

  def create
    @proposal.save
    respond_with(@proposal)
  end

  def update
    @proposal.update_attributes(proposal_params)
    respond_with(@proposal)
  end

  def destroy
    @proposal.destroy
    respond_with(@proposal)
  end

  protected

    def proposal_params
      params.require(:proposal).permit(:name, :description, :active)
    end
end
