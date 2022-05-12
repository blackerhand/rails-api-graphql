module SmartResolver
  extend ActiveSupport::Concern

  module ClassMethods
    def smart_resolver(field_name, opts = {})
      resolver_name = field_name.to_s.gsub('/', '_')

      opts[:resolver]    ||= "Resolvers::#{field_name.to_s.camelize}".constantize
      opts[:description] ||= I18n.t_smart(opts[:resolver])

      field resolver_name, opts
    end
  end
end
