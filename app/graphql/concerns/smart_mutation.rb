module SmartMutation
  extend ActiveSupport::Concern

  module ClassMethods
    def smart_mutation(field_name, opts = {})
      mutation_name = field_name.to_s.gsub('/', '_')
      class_scope   = field_name.to_s.classify

      input          = opts.delete(:input) || "Inputs::#{class_scope}".constantize
      input_required = opts.delete(:input_required) || true

      opts[:mutation]    ||= "Mutations::#{class_scope}".constantize
      opts[:description] ||= I18n.t_smart(opts[:mutation])

      field mutation_name, opts do
        argument :input, input, required: input_required
      end
    end
  end
end
