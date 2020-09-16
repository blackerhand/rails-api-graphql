module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument

    def self.default_graphql_name
      "#{name.sub('Inputs::', '').gsub('::', '_')}Input"
    end

    def self.description(new_description = nil)
      super || i18n_desc
    end

    def self.i18n_desc
      return unless to_s.start_with?('Types::')
      return if to_s == 'Types::BaseInputObject'

      I18n.t("graphql.#{to_s.gsub('Inputs::', '').underscore.gsub('/', '_')}")
    end
  end
end
