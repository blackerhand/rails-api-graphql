module SmartMutation
  extend ActiveSupport::Concern

  module ClassMethods
    def smart_mutation(field_name, opts = {})
      mutation_name = field_name.to_s.gsub('/', '_')
      class_scope   = field_name.to_s.classify

      mutation = opts.delete(:mutation) || "Mutations::#{class_scope}".constantize
      input    = opts.delete(:input) || "Inputs::#{class_scope}".constantize
      required = opts.delete(:required) || true
      desc     = opts.delete(:desc) || i18n_desc(field_name)

      field mutation_name, mutation: mutation, description: desc do
        argument :input, input, required: required
      end
    end

    def self.description(new_description = nil)
      super || i18n_desc
    end

    def i18n_desc(field_name)
      I18n.t("graphql.#{field_name.to_s.gsub('/', '.')}")
    end
  end
end
