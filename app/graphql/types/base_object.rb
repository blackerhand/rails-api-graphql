module Types
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField

    implements GraphQL::Types::Relay::Node
    global_id_field :id
  end
end
