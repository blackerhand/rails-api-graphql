module Types
  class BaseArgument < GraphQL::Schema::Argument
    def description(text = nil)
      super || (input? ? I18n.t_smart(type.try(:of_type)) : I18n.t_smart(owner, name))
    end

    def input?
      name == 'input'
    end
  end
end
