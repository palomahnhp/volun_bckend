module ApplicationHelper
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