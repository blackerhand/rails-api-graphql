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

  def t_graphql(field, opts = {})
    return if field.blank?

    t("graphql.#{field}", opts)
  end

  def tran_model_to_activerecord(model)
    model.split('::')[1].gsub('Type', '').underscore
  end

  def tran_model_to_graphql(model)
    model.gsub(/^\D*?::/, '').underscore.gsub('/', '_')
  end

  def t_smart(model, attributes = nil, opts = {})
    model      = model.to_s
    attributes = attributes.to_s

    return if model.blank?
    return 'ID' if attributes == 'id' || attributes == 'nodeId'

    unless model.start_with?(/(Mutations::|Inputs::|Models::|Resolvers::)/)
      model      = model.underscore
      attributes = nil if model == attributes

      return t_activerecord(model, attributes, default: nil)
    end

    if model.start_with?(/(Mutations::|Inputs::|Resolvers::)/) && attributes.blank?
      t_graphql(tran_model_to_graphql(model), opts)
    else
      model      = tran_model_to_activerecord(model)
      attributes = nil if model == attributes

      t_activerecord(model, attributes, opts)
    end
  end
end
