# helpers for sign grape
module SmartMutation
  extend ActiveSupport::Concern

  module ClassMethods
    def smart_mutation(field_name, opts = {})
      mutation_name = field_name.to_s.gsub('/', '_')
      class_scope   = field_name.to_s.classify

      mutation_class = opts.delete(:mutation_class) || "Mutations::#{class_scope}".constantize
      input_class    = opts.delete(:input_class) || "Inputs::#{class_scope}".constantize
      required       = opts.delete(:required) || true
      desc           = opts.delete(:desc) || i18n_desc(field_name)

      field mutation_name, mutation: mutation_class, description: desc do
        argument :input, input_class, required: required
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
