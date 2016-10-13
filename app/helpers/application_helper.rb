module ApplicationHelper
end

module ActionView::Helpers::FormHelper
  def simple_nested_fields_for(record_or_name_or_array, *args, &block)
    options = args.extract_options!.reverse_merge(:builder => NestedForm::SimpleBuilder)
    simple_fields_for(record_or_name_or_array, *(args << options), &block)
  end
end
