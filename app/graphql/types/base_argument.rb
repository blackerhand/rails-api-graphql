module Types
  class BaseArgument < GraphQL::Schema::Argument
    def description(text = nil)
      super || i18n_desc
    end

    def input?
      name == 'input'
    end

    def model_class
      input? ? owner.name.to_s.underscore : owner.name.to_s.split('::')[1].underscore
    end

    def i18n_desc
      return 'ID' if name == 'id' || name == 'nodeId'

      I18n.t(input? ? "graphql.#{model_class}" : "activerecord.attributes.#{model_class}.#{name}")
    end
  end
end
