module Types
  class BaseObject < GraphQL::Schema::Object
    include BatchField

    field_class Types::BaseField
    implements GraphQL::Types::Relay::Node

    batch_field :owner, Models::UserType, null: true
    batch_field :modifier, Models::UserType, null: true

    field :disabled_at, Integer, null: true
    field :created_at, Integer, null: true
    field :updated_at, Integer, null: true

    def self.description(new_description = nil)
      super || I18n.t_smart(self)
    end
  end
end
