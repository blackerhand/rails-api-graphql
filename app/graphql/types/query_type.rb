module Types
  class QueryType < Types::BaseObject
    include SmartResolver
    add_field(GraphQL::Types::Relay::NodeField)

    smart_resolver :'users/current'
    smart_resolver :'users/list'
  end
end
