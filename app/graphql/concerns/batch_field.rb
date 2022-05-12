# field :collection, Models::CollectionType, null: false
# field :elements, [Models::ElementType, null: true], null: true

# def collection
#   # RecordLoader.for(::Collection).load(object.collection_id)
#   AssociationLoader.for(::Post, :collection).load(object)
# end

# def elements
#   AssociationLoader.for(::Post, :elements).load(object)
# end
module BatchField
  extend ActiveSupport::Concern

  module ClassMethods
    def batch_field(field_name, type, opts = {})
      field field_name, type, opts

      define_method field_name do
        AssociationLoader.for(object.class, field_name).load(object)
      end
    end
  end
end
