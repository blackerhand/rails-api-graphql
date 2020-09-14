module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument

    def self.default_graphql_name
      self.name.to_s.sub("Inputs", "").gsub("::", "") + 'Input'
    end
  end
end
