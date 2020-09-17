module SmartResolver
  extend ActiveSupport::Concern

  module ClassMethods
    def smart_resolver(field_name, opts = {})
      resolver_name = field_name.to_s.gsub('/', '_')
      resolver      = opts.delete(:resolver) || "Resolvers::#{field_name.to_s.classify}".constantize
      desc          = opts.delete(:desc) || I18n.t_smart(resolver)

      field resolver_name, resolver: resolver, description: desc
    end
  end
end
