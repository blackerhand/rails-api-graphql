module SmartMutation
  extend ActiveSupport::Concern

  module ClassMethods
    def smart_mutation(field_name, opts = {})
      mutation_name = field_name.to_s.gsub('/', '_')
      class_scope   = field_name.to_s.classify

      mutation = opts.delete(:mutation) || "Mutations::#{class_scope}".constantize
      input    = opts.delete(:input) || "Inputs::#{class_scope}".constantize
      required = opts.delete(:required) || true
      desc     = opts.delete(:desc) || I18n.t_smart(mutation)

      field mutation_name, mutation: mutation, description: desc do
        argument :input, input, required: required
      end
    end
  end
end
