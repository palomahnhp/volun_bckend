require 'scaffold_helper'

module RequestFormHelper


  def link_to_process(record, opts = {})
    return unless can?(:process, record)
    options = {
      id:     "#{dom_id(record)}_process",
      text:   build_icon(:process, icon_name: :play),
      path:   "process_request_form_#{record.class.model_name.singular}_path",
      remote: false,
      method: :get,
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end

  def link_to_undo_rejection(record, opts = {})
    return unless can?(:process, record)
    options = {
      id:     "#{dom_id(record)}_process",
      text:   build_icon(:undo_rejection, icon_name: :undo),
      path:   "undo_rejection_request_form_#{record.class.model_name.singular}_path",
      remote: false,
      method: :get,
      data:   { confirm: t('messages.confirm_mark_as_pending')}
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end


end
