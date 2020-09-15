module SmartResolver
  extend ActiveSupport::Concern

  module ClassMethods
    def smart_resolver(field_name, opts = {})
      resolver_name = field_name.to_s.gsub('/', '_')
      class_scope   = field_name.to_s.classify

      resolver = opts.delete(:resolver) || "Resolvers::#{class_scope}".constantize
      desc     = opts.delete(:desc) || i18n_desc(field_name)

      field resolver_name, resolver: resolver, description: desc
    end

    def self.description(new_description = nil)
      super || i18n_desc
    end

    def i18n_desc(field_name)
      I18n.t("graphql.#{field_name.to_s.gsub('/', '.')}")
    end
  end
end
