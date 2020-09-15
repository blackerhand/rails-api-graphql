module Inputs
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Inputs::BaseInputArgument

    def self.default_graphql_name
      "#{name.sub('Inputs::', '').gsub('::', '_')}Input"
    end

    def self.description(new_description = nil)
      super || i18n_desc
    end

    def self.i18n_desc
      I18n.t("graphql.#{to_s.underscore.gsub('inputs', '').gsub('/', '.')}", default: nil)
    end
  end
end
