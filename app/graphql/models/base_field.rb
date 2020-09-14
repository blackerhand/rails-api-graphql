module Models
  class BaseField < GraphQL::Schema::Field
    argument_class Models::BaseModelArgument

    def description(text = nil)
      super || i18n_desc
    end

    def model_class
      self.owner.to_s.split('::')[1].gsub('Type', '').underscore
    end

    def i18n_desc
      I18n.t("activerecord.attributes.#{model_class}.#{name}")
    end
  end
end
