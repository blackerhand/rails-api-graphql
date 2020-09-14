module Inputs
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Inputs::BaseInputArgument

    def self.default_graphql_name
      "#{name.sub('Inputs', '').gsub('::', '')}Input"
    end
  end
end
