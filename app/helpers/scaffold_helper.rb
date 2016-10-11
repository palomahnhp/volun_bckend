module ScaffoldHelper

  def page_title
    content_tag(:title) do
      title = Property.app_name
      title << " - #{@title}" if @title
    end
  end

  def section_title(title, options = {})
    @title ||= title
    tag = options.delete(:tag) || :h1
    content_tag(tag, title , {class: 'page-header'}.merge(options))
  end

  def page_alert(model_class, options={})
    content_tag :div, options[:message], {id: "#{model_class.table_name}_msg"}
  end

  def search_form_for_index(search, search_condition, options={})
    form =  search_form_for search, class: 'form-inline search-form', role: "form" do |f|
              (get_hidden_fields options[:hidden_fields] || {}) +
                (hidden_field_tag :per_page, params[:per_page]) +
                (f.search_field search_condition, class: 'form-control', placeholder:'introducir texto') +
                (button_tag name: 'commit', class: 'btn btn-default' do
                  ('Buscar' + '  ' + (fa_icon 'search')).html_safe
                end)
            end
    form.html_safe
  end

  def get_hidden_fields(hidden_fields)
    hfs = ''
    hidden_fields.each do |k,v|
      hfs += hidden_field_tag k, v
    end
    hfs.html_safe
  end

  def cancel_button(record, return_path=nil)
    path = return_path.to_s == "back" ? :back : public_send(return_path || "#{record.class.to_s.tableize}_path")

    if request.xhr?
      link_to t('action.cancel'), 'javascript:void(0)', class: [:btn, 'btn-danger'], onclick: "$(this).parents('.js_dialog').remove();return false"
    else
      link_to t('action.back'), path, class: [:btn, 'btn-default']
    end
  end

  def link_to_new(model, opts={})
    return unless can?(:create, model)
    options = {
        text: fa_icon('plus')+" "+content_tag(:span, t("action.add", model: model.model_name.human)),
        path: "new_#{model.model_name.singular}_path",
        remote: true,
        class: 'btn btn-primary',
        id: "new_#{model.model_name.singular}_link"
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, options[:path_params]||{}), options)
  end

  def link_to_show(record, opts={})
    return unless can?(:show, record)
    options = {
        text: icon_show,
        path: "#{record.class.model_name.singular}_path",
        class: 'grey-color'
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record,options[:path_params]||{}), options)
  end

  def link_to_edit(record, opts={})
    return unless can?(:edit, record)
    options = {
        id: "#{dom_id(record)}_edit",
        text: icon_edit,
        path: "edit_#{record.class.model_name.singular}_path",
        remote: true,
        class: 'grey-color'
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record,options[:path_params]||{}), options)
  end

  def link_to_destroy(record, opts={})
    return unless can?(:destroy, record)
    options = {
        id: "#{dom_id(record)}_destroy",
        text: icon_destroy,
        path: "#{record.class.model_name.singular}_path",
        remote: true,
        method: :delete,
        data: {confirm: t('messages.are_your_sure')}
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end

  def button_to_back(path=:back)
    link_to(t('action.back'), path, class: "btn btn-default")
  end

  def button_to_edit(record, opts={})
    link_to_edit(record, {text: icon_edit+' '+t('action.edit', model: ''), class: "btn btn-primary"}.merge(opts))
  end

end

class ActionView::Helpers::FormBuilder

  def search_form(attr, options)
    text_field(attr, {class: "search-query js_autofocus searchtext form-control",
                      placeholder: options[:placeholder]|| I18n.t("action.search", model: "")})
  end
end
