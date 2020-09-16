module Types
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField
    implements GraphQL::Types::Relay::Node

    def self.description(new_description = nil)
      super || i18n_desc
    end

    def self.model_class
      to_s.split('::')[1].gsub('Type', '').underscore
    end

    def self.i18n_desc
      return unless to_s.start_with?('Models::')

      I18n.t("activerecord.models.#{model_class}", default: nil)
    end
  end
end
