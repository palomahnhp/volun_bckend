module ScaffoldHelper

  def model_title(model_class, opts = {})
    main_title(model_class.model_name.human(count: 2), opts)
  end

  def main_title(title, opts = {})
    html_tag = opts.delete(:html_tag) || :h1
    content_tag(html_tag, title, { class: 'page-header' }.merge(opts))
  end

  def search_collection(search, search_condition, options = {})
    form =  search_form_for search, class: 'form-inline search-form', role: 'form', wrapper: :horizontal_form do |f|
              (get_hidden_fields options.delete(:hidden_fields) || {}) +
                (get_q_hidden_fields options.delete(:q_hidden_fields) || {}) +
                (hidden_field_tag :per_page, params[:per_page]) +
                (f.search_field search_condition, class: 'form-control', placeholder: t('type_text')) +
                (button_tag name: 'commit', class: 'btn btn-default' do
                  ((fa_icon 'search')).html_safe
                end)
            end
    form.html_safe
  end

  def search_collection_alt(search, search_condition, search_condition_alt, options = {})
    form =  search_form_for search, class: 'form-inline search-form', role: 'form', wrapper: :horizontal_form do |f|
              (get_hidden_fields options.delete(:hidden_fields) || {}) +
                (get_q_hidden_fields options.delete(:q_hidden_fields) || {}) +
                (hidden_field_tag :per_page, params[:per_page]) +
                (f.search_field search_condition_alt, class: 'form-control', placeholder: t('id')) +
                (f.search_field search_condition, class: 'form-control', placeholder: t('type_text')) +
                (button_tag name: 'commit', class: 'btn btn-default' do
                  ((fa_icon 'search')).html_safe
                end)
            end
    form.html_safe
  end

  def get_hidden_fields(hidden_fields)
    html_tag = ''
    grouped_hidden_fields = hidden_fields.select{ |_k, v| v.is_a? Hash }
    grouped_hidden_fields.each do |group_name, _hidden_fields|
      html_tag += content_tag(:div, id: group_name) do
                    build_hidden_fields(_hidden_fields)
                  end
    end
    independent_hidden_fields = hidden_fields.reject{ |_k, v| v.is_a? Hash }
    html_tag += build_hidden_fields independent_hidden_fields
    html_tag.html_safe
  end

  def build_hidden_fields(hidden_fields)
    hidden_fields.inject('') do |hf_tags, (name, value)|
      if value.is_a?(Array)
        value.each do |v|
          hf_tags += hidden_field_tag(build_name_attr(name), v, class: name.to_s.gsub(/\[|\]/, '_').sub(/_+\z/, ''))
        end
        hf_tags
      else
        hf_tags + hidden_field_tag(build_name_attr(name), value)
      end
    end.html_safe
  end

  def get_q_hidden_fields(q_hidden_fields)
    html_tag = ''
    grouped_q_hidden_fields = q_hidden_fields.select{ |_k, v| v.is_a? Hash }
    grouped_q_hidden_fields.each do |group_name, _q_hidden_fields|
      html_tag += content_tag(:div, id: group_name) do
                    build_q_hidden_fields(_q_hidden_fields)
                  end
    end
    independent_q_hidden_fields = q_hidden_fields.reject{ |_k, v| v.is_a? Hash }
    html_tag += build_q_hidden_fields independent_q_hidden_fields
    html_tag.html_safe
  end

  def build_q_hidden_fields(hidden_fields)
    hidden_fields.inject('') do |hf_tags, (name, value)|
      hf_tags + hidden_field_tag("q[#{name}]", value)
    end.html_safe
  end

  def convert_filters_to_params(filters)
    filters.inject({}) do |params, (k,v)|
      params.merge(k.sub(/_[^_]+\z/,'') => v)
    end
  end

  def build_name_attr(name)
    name = name.to_s
    /\Aq_(.*)\z/i === name ? "q[#{name.sub('q_', '')}]" : name
  end

  def show_simple_base_errors(form)
    return unless form.object.errors[:base].present?

    content_tag :div, class: 'has-error alert alert-danger alert-dismissable' do
      "<button name=\"button\" type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button>" \
      "#{form.object.errors[:base].to_sentence}".html_safe
    end
  end

  def link_to_new(model, opts = {})
    return unless can?(:create, model)
    new_i18n_path = opts.delete(:fem).present? ? 'new_fem' : 'new'
      options = {
        text:   "#{fa_icon('plus')} #{content_tag(:span, t("action.#{new_i18n_path}", model: model.model_name.human))}".html_safe,
        path:   "new_#{model.model_name.singular}_path",
        remote: false,
        class:  'btn btn-primary',
        id:     "new_#{model.model_name.singular}_link"
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, options.delete(:path_params)||{}), options)
  end

  def link_to_show(record, opts = {})
    return unless can?(:show, record)
    options = {
        text: icon_show,
        path: "#{record.class.model_name.singular}_path",
        class: 'grey-color',
        remote: true
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end

  def link_to_edit(record, opts = {})
    return unless can?(:edit, record)
    options = {
        id:     "#{dom_id(record)}_edit",
        text:   icon_edit,
        path:   "edit_#{record.class.model_name.singular}_path",
        remote: false,
        class:  'grey-color'
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end

  def link_to_destroy(record, opts = {})
    return unless can?(:destroy, record)
    options = {
        id:     "#{dom_id(record)}_destroy",
        text:   icon_destroy,
        path:   "#{record.class.model_name.singular}_path",
        remote: false,
        method: :delete,
        data:   {confirm: t('messages.are_you_sure')}
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end

  def link_to_recover(record, opts = {})
    return unless can?(:destroy, record)
    options = {
        id:     "#{dom_id(record)}_recover",
        text:   icon_recover,
        path:   "recover_#{record.class.model_name.singular}_path",
        remote: false,
        method: :post,
        data:   {confirm: t('messages.are_you_sure')}
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end

  def link_to_trackings(record, type, project = nil, opts = {})
    return unless can?(:read, "#{type.titleize}::Tracking".safe_constantize)
    options = {
        id:     "#{dom_id(record)}_trackings",
        text:   icon_tracking,
        path:   "#{type}_trackings_path",
        path_params: {q: {"#{record.class.model_name.singular}_id_eq": record}, project_id_assoc: project },
        remote: false,
        method: :get
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, options[:path_params]||{}), options)
  end

  def link_to_sms(record, opts = {})
    return unless can?(:show_sms, record)
    options = {
        text: icon_sms,
        path: "show_sms_path",
        path_params: { volunteer: record },
        class: 'grey-color',
        remote: true
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, options[:path_params]||{}), options)
  end

  def link_to_mail(record, opts = {})
    return unless can?(:show_mail, record)
    options = {
        text: icon_mail,
        path: "show_mail_path",
        path_params: { volunteer: record },
        class: 'grey-color',
        remote: true
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, options[:path_params]||{}), options)
  end

  def link_to_linkable(record, opts = {})
    #return unless can?(:recover, record)
    options = {
        id:     "#{dom_id(record)}_recover",
        text:   icon_recover,
        path:   "#{record.linkable_type.underscore}_path",
        remote: false,
        method: :post,
        data:   {confirm: t('messages.are_you_sure')}
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end

  # TODO uncomment when index js response is done
  # def link_to_index(record, opts = {})
  #   return unless can?(:list, record)
  #   options = {
  #       id:     "#{dom_id(record)}_index",
  #       text:   build_icon :index, icon_name: 'list-alt',
  #       path:   "#{record.class.model_name.plural}_path",
  #       remote: true,
  #       method: :get
  #   }.merge(opts)
  #   path = options.delete(:path)
  #   text = options.delete(:text)
  #
  #   link_to(text, public_send(path, record, options[:path_params]||{}), options)
  # end

  def button_to_back(path=:back)
    link_to(t('action.back'), path, class: "btn btn-default")
  end

  def button_to_edit(record, opts = {})
    link_to_edit(record, {text: icon_edit+' '+t('action.edit', model: ''), class: "btn btn-primary"}.merge(opts))
  end

  def default_form_options
    {
      remote:           request.xhr?,
      html:             { class: 'form-horizontal' },
      wrapper:          :horizontal_form,
      wrapper_mappings: { check_boxes:   :horizontal_radio_and_checkboxes,
                          radio_buttons: :horizontal_radio_and_checkboxes,
                          file:          :horizontal_file_input,
                          boolean:       :horizontal_boolean }
     }
  end

  def attachable_form_options
    @attachable_form_options = default_form_options
    @attachable_form_options[:html] = { class: 'form-horizontal', multipart: true }
    @attachable_form_options
  end

  def show_simple_date(date, options = {})
    return unless date

    format =  case date
              when Date
                '%d/%m/%Y'
              when DateTime, ActiveSupport::TimeWithZone
                '%d/%m/%Y %H:%M'
              else
                '%d/%m/%Y'
              end
    l(date, { format: format }.merge(options)) if format
  end

  def show_attr(record, attr_name, date_opts = {})
    return record.public_send "#{attr_name}_i18n" if record.respond_to? "#{attr_name}_i18n"

    attr_value = record.public_send attr_name
    case attr_value
    when TrueClass, FalseClass
      t("humanize.#{attr_value}")
    when Date, DateTime, ActiveSupport::TimeWithZone
      show_simple_date(attr_value, date_opts)
    else
      attr_value
    end
  end

end
