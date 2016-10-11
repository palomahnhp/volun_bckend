class ProposalsController < ApplicationController

  load_and_authorize_resource

  def index
    params[:q] ||= Proposal.ransack_default
    @q = @proposals.search(params[:q])
    @proposals = @q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_to do |format|
      format.html
      format.json { render json: {total: @proposals.count, records: @proposals.map{|p| {id: p.id, text: p.to_s} }.as_json } }
      format.js { render 'global/index', locals: { index_folder: Proposal.model_name.plural }}
    end
  end

  def show
  end

  def new
    @proposal.name       = params[:init_data] if params[:init_data].kind_of?(String)
    @proposal.attributes = params[:init_data] if params[:init_data].kind_of?(Hash)

    respond_to do |format|
      format.html
      format.js {render 'global/popup_form', locals: {record: @proposal} }
    end
  end

  def edit

    respond_to do |format|
      format.html
      format.js {render 'global/popup_form', locals: {record: @proposal} }
    end
  end

  def create

    respond_to do |format|
      if @proposal.save
        flash[:notice] = I18n.t('activerecord.messages.successfully_created')
        format.html { redirect_to proposals_path}
        format.js {render 'global/create', locals: {record: @proposal} }
      else
        format.html { render action: 'new' }
        format.js {render 'global/popup_form', locals: {record: @proposal} }
      end
    end
  end

  def update

    respond_to do |format|
      if @proposal.update_attributes(proposal_params)
        flash[:notice] = I18n.t('activerecord.messages.successfully_updated')
        format.html { redirect_to proposals_path}
        format.js {render 'global/update', locals: {record: @proposal} }
      else
        format.html { render action: 'edit' }
        format.js {render 'global/popup_form', locals: {record: @proposal} }
      end
    end
  end

  def destroy

    respond_to do |format|
      if @proposal.destroy
        flash[:notice] = I18n.t('activerecord.messages.successfully_destroyed')
      else
        flash[:alert] = not_destroy_element_notice(@proposal)
      end
      format.html{ redirect_to proposals_path }
      format.js {render 'global/destroy', locals: {record: @proposal} }
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def proposal_params
      params.require(:proposal).permit(:name, :comments, :registry_date, :approval_date)
    end
end
