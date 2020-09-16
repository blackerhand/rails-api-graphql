module Types
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument

    def description(text = nil)
      super || I18n.t_smart(owner, name)
    end
  end
end
