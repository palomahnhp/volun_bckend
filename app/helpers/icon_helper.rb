module IconHelper

  def icon_new(opts = {})
    build_icon(:new, opts.merge(icon_name: 'plus'))
  end

  def icon_edit(opts = {})
    build_icon(:edit, opts.merge(icon_name: 'pencil'))
  end

  def icon_show(opts = {})
    build_icon(:show, opts.merge(icon_name: 'search'))
  end

  def icon_destroy(opts = {})
    build_icon(:delete, opts.merge(icon_name: 'times', class: 'danger'))
  end

  def icon_recover(opts = {})
    build_icon(:bolt, opts.merge(icon_name: 'bolt', class: 'danger'))
  end

  def icon_search(opts = {})
    build_icon(:search, opts)
  end

  def build_icon(action, opts = {})
    options        = {}
    options[:text] = opts.delete(:text)
    options[:alt]  = opts.delete(:alt) || options[:text] || t("action.#{action}")
    fa_icon(opts.delete(:icon_name) || action, options.merge(opts))
  end

end
