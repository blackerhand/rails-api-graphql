module MessageHelper
  def build_field_name(field)
    field.try(:name)
  end

  def build_model(obj, field)
    return obj.class.to_s if obj.present?

    field.owner.to_s if field.present?
  end

  def build_message(err, obj, args, ctx, field, format = nil)
    [err.message, {
      field_name: build_field_name(field),
      model_name: build_model(obj, field),
      format:     format
    }]
  end

  def i18n_activerecord(model, attributes = nil, opts = {})
    return if model.blank?

    if attributes.present?
      I18n.t("activerecord.attributes.#{model}.#{attributes}", opts)
    else
      I18n.t("activerecord.models.#{model}", opts)
    end
  end

  def i18n_explanation(explanation, opts = {})
    return if explanation.blank?

    I18n.t("errors.messages.#{explanation.underscore.gsub(' ', '_')}", opts)
  end

  def i18n_graphql_name(field)
    return if field.blank?

    I18n.t("graphql.#{field}")
  end
end
