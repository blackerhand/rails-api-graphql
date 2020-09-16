module Types
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument

    def description(text = nil)
      super || i18n_desc
    end

    def model_field?
      owner.to_s.start_with?('Models::')
    end

    def model_class
      owner.to_s.split('::')[1].gsub('Type', '').underscore
    end

    def i18n_desc
      return 'ID' if name == 'id'

      if model_field?
        I18n.t("activerecord.attributes.#{model_class}.#{name}")
      else
        I18n.t("activerecord.models.#{name.underscore}")
      end
    end
  end
end
