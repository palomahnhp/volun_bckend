require 'scaffold_helper'

module RequestFormHelper


  def link_to_process(record, opts = {})
    return unless can?(:process, record)
    options = {
      id:     "#{dom_id(record)}_process",
      text:   build_icon(:play),
      path:   "process_request_form_#{record.class.model_name.singular}_path",
      remote: false,
      method: :get,
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end


end
