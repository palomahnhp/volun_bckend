module IconHelper

  def icon_new(opts = {})
    build_icon(:new, opts.merge(icon_name: 'plus'))
  end

  def icon_edit(opts = {})
    build_icon(:edit, opts.merge(icon_name: 'pencil', title: t('action.edit', model: '')))
  end

  def icon_show(opts = {})
    build_icon(:show, opts.merge(icon_name: 'search', title: t('action.show', model: t('details').downcase)))
  end

  def icon_destroy(opts = {})
    if 'recover'.in?(controller.action_methods)
      action    = :archive
      icon_name = :archive
    else
      action    = :delete
      icon_name = :times
    end
    build_icon(action, opts.merge(icon_name: icon_name, class: 'danger'))
  end

  def icon_recover(opts = {})
    build_icon(:recover, opts.merge(icon_name: 'bolt', class: 'danger'))
  end

  def icon_search(opts = {})
    build_icon(:search, opts)
  end

  def build_icon(action, opts = {})
    icon_name       = opts.delete(:icon_name) || action
    options         = {}
    options[:text]  = opts.delete(:text)
    options[:title] = opts.delete(:title) || t("action.#{action}", default: options[:text] || icon_name)
    options[:alt]   = opts.delete(:alt) || options[:title]
    fa_icon(icon_name, options.merge(opts))
  end

end
