module ErrorsHelper
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
end
