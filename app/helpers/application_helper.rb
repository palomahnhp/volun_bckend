module ApplicationHelper

  def uweb_user_data
    @uweb_user_data = session[:uweb_user_data] || {}
    @uweb_user_data[:full_name] = "#{@uweb_user_data[:name]} #{@uweb_user_data[:surname]} #{@uweb_user_data[:second_surname]} "
    @uweb_user_data
  end

  def logged_user_name
    user_data = session[:uweb_user_data] || {}
    "#{user_data[:name]} #{user_data[:surname]} #{user_data[:second_surname]} "
  end

  def show_simple_list(ar_collection, attr = :name)
    ar_collection.pluck(attr).join(" <strong>-</strong> ").html_safe
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