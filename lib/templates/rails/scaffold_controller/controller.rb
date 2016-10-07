<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController

  load_and_authorize_resource

  def index
    params[:q] ||= <%= singular_table_name.camelize %>.ransack_default
    @q = @<%= plural_table_name %>.search(params[:q])
    @<%= plural_table_name %> = @q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_to do |format|
      format.html
      format.json { render json: {total: @<%= plural_table_name %>.count, records: @<%= plural_table_name %>.map{|p| {id: p.id, text: p.to_s} }.as_json } }
      format.js { render 'global/index', locals: { index_folder: <%= singular_table_name.camelize %>.model_name.plural }}
    end
  end

  def show
  end

  def new
    @<%= singular_table_name %>.name       = params[:init_data] if params[:init_data].kind_of?(String)
    @<%= singular_table_name %>.attributes = params[:init_data] if params[:init_data].kind_of?(Hash)

    respond_to do |format|
      format.html
      format.js {render 'global/popup_form', locals: {record: @<%= singular_table_name %>} }
    end
  end

  def edit

    respond_to do |format|
      format.html
      format.js {render 'global/popup_form', locals: {record: @<%= singular_table_name %>} }
    end
  end

  def create

    respond_to do |format|
      if @<%= singular_table_name %>.save
        flash[:notice] = successfully_created_notice(<%= singular_table_name.camelize %>)
        format.html { redirect_to <%= plural_table_name %>_path}
        format.js {render 'global/create', locals: {record: @<%= singular_table_name %>} }
      else
        format.html { render action: 'new' }
        format.js {render 'global/popup_form', locals: {record: @<%= singular_table_name %>} }
      end
    end
  end

  def update

    respond_to do |format|
      if @<%= singular_table_name %>.update_attributes(<%= singular_table_name %>_params)
        flash[:notice] = successfully_updated_notice(<%= singular_table_name.camelize %>)
        format.html { redirect_to <%= plural_table_name %>_path}
        format.js {render 'global/update', locals: {record: @<%= singular_table_name %>} }
      else
        format.html { render action: 'edit' }
        format.js {render 'global/popup_form', locals: {record: @<%= singular_table_name %>} }
      end
    end
  end

  def destroy

    respond_to do |format|
      if @<%= singular_table_name %>.destroy
        flash[:notice] = successfully_destroy_notice(<%= singular_table_name.camelize %>)
      else
        flash[:alert] = not_destroy_element_notice(@<%= singular_table_name %>)
      end
      format.html{ redirect_to <%= plural_table_name %>_path }
      format.js {render 'global/destroy', locals: {record: @<%= singular_table_name %>} }
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def <%= singular_table_name %>_params
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    end
end
<% end -%>