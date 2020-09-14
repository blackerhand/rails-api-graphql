module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def self.default_graphql_name
      self.name.to_s.sub("Mutations", "").gsub("::", "").camelize(:lower)
    end
  end
end
