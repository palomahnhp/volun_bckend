module I18nHelper

  def model_plural_name(model)
    t("activerecord.models.#{model.model_name.singular}", count: 2)
  end

  def t_action_new(model)
    t("action.new_#{model.model_gender}", model: model.model_name.human).capitalize
  end

  def t_action_edit(model)
    t("action.edit", model: model.model_name.human).capitalize
  end

  def t_action_show(model)
    t("action.show", model: model.model_name.human).capitalize
  end

end
