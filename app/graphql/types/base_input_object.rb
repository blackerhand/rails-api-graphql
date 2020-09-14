module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument

    def self.default_graphql_name
      "#{name.sub('Inputs', '').gsub('::', '')}Input"
    end
  end
end
