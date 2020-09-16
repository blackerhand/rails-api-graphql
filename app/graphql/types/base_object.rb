module Types
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField
    implements GraphQL::Types::Relay::Node

    def self.description(new_description = nil)
      super || I18n.t_smart(self)
    end
  end
end
