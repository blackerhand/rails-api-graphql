module Types
  class QueryType < Types::BaseObject
    include SmartResolver
    add_field(GraphQL::Types::Relay::NodeField)

    smart_resolver :'user/current'
    smart_resolver :'user/detail'
    smart_resolver :'user/list'
  end
end
