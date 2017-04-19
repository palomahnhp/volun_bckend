module ApplicationHelper

  def show_simple_list(ar_collection, attr = :name)
    ar_collection.pluck(attr).join(" <strong>-</strong> ").html_safe
  end

  def date_input_html(date)
    {
      class: 'datepicker',
      placeholder: 'dd/mm/aaaa',
      value: date ? date.strftime('%d/%m/%Y') : nil,
      data: {mask: '99/99/9999'}
    }
  end
  
  def date_input_html_default_values(date, opts = {})
    {
      class: 'datepicker',
      placeholder: 'dd/mm/aaaa',
      value: date ? date.strftime('%d/%m/%Y') : Date.today.strftime('%d/%m/%Y'),
      data: {mask: '99/99/9999'}
    }.reverse_merge(opts)
  end
  
  def date_input_html_no_default_values(date, opts = {})
    {
      class: 'datepicker',
      placeholder: 'dd/mm/aaaa',
      value: date ? date.strftime('%d/%m/%Y') : nil,
      data: {mask: '99/99/9999'}
    }.reverse_merge(opts)
  end

  def check_box_filter_for(param_name, js_selector = nil)
    check_box_tag "q[#{param_name}]",
                  params[param_name],
                  params[param_name],
                  onchange: "update_hidden_inputs(this, '#{js_selector || '#' + param_name}')"
  end

  def link_to_extendable(extendable_class, options = {})
    return unless can? (options[:action].presence || :read), extendable_class

    path = options[:path].presence || public_send("new_#{extendable_class.model_name.singular}_path")
    link_to path, options[:html_input] || {} do
      content_tag :div, class: "panel panel-#{extendable_class.exists? ? 'warning' : 'danger'}" do
        ( content_tag :div, class: 'panel-heading' do
            content_tag :h3, extendable_class.model_name.human, class: 'panel-title'
          end  )+
        ( content_tag :div, extendable_class.model_name.human, class: 'panel-body' do
            options[:body]
          end  )
      end
    end
  end

end

module ActionView::Helpers::FormHelper
  def simple_nested_fields_for(record_or_name_or_array, *args, &block)
    options = args.extract_options!.reverse_merge(:builder => NestedForm::SimpleBuilder)
    simple_fields_for(record_or_name_or_array, *(args << options), &block)
  end
end

class DatepickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options.merge!(placeholder: I18n.t('date_placeholder')) unless input_html_options[:placeholder]
    input_html_options[:class] << :"form-control"
    @builder.text_field(attribute_name, input_html_options) +
    @builder.hidden_field(attribute_name, { class: "#{attribute_name}-alt"})
  end
end