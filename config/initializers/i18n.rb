module I18n
  module_function

  def t_activerecord(model, attributes = nil, opts = {})
    return if model.blank?

    if attributes.present?
      t("activerecord.attributes.#{model}.#{attributes}", opts)
    else
      t("activerecord.models.#{model}", opts)
    end
  end

  def t_explanation(explanation, opts = {})
    return if explanation.blank?

    t("errors.messages.#{explanation.underscore.gsub(' ', '_')}", opts)
  end

  def t_graphql(field)
    return if field.blank?

    t("graphql.#{field}")
  end
end
