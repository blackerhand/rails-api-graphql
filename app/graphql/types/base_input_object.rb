module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument

    def self.default_graphql_name
      "#{name.sub('Inputs::', '').gsub('::', '_')}Input"
    end

    def self.description(new_description = nil)
      super || I18n.t_smart(self)
    end
  end
end
