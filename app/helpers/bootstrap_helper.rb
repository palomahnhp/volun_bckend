module BootstrapHelper

  ALERT_TYPES = {
      notice:  :success,
      info:    :info,
      warning: :warning,
      alert:   :danger,
      error:   :danger
  }

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      Array(message).each do |msg|
        flash_messages << flash_message(type, msg) if msg
      end
    end
    flash.discard
    flash_messages.join("\n").html_safe
  end

  def flash_message(type, message, dismisable=true)
    return nil if message.blank? or !ALERT_TYPES.keys.include?(type.to_sym)

    type = ALERT_TYPES[type.to_sym]

    content_tag(:div, :class => "alert fade in alert-#{type} #{"alert-dismissable" if dismisable}") do
      if dismisable
        content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert","aria-hidden" => "true", "type" => "button")+
        message
      else
        message
      end
    end
  end

  def record_errors(record, attributes=nil, associations_with_attributes = {})
    messages = []
    message = if attributes
                attributes.map{|attr| record.errors[attr]}.flatten.to_sentence
              else
                record.errors.full_messages.to_sentence
              end
    messages << message unless message.blank?
    associations_with_attributes.each do |association, attrs|
      record.send(association).map do |element|
        association_message = attrs.map{|attr| element.errors[attr]}.flatten.to_sentence
        messages << association_message unless association_message.blank?
      end
    end
    flash_message :error, messages.flatten.to_sentence
  end

  def navbar_index_item(model_class, options={})
    return nil unless can? :read, model_class
    navbar_item (options[:title] || model_plural_name(model_class)),
                (options[:url]||send("#{model_class.model_name.plural}_path"))
  end

end
