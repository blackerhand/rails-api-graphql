module Types
  module BaseInterface
    include GraphQL::Schema::Interface
    field_class Types::BaseField

    global_id_field :id

    field :disabled_at, Integer, null: true
    field :created_at, Integer, null: true
    field :updated_at, Integer, null: true
  end
end
