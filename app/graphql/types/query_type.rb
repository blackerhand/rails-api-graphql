module Types
  class QueryType < Types::BaseObject
    field :current_user, Models::UserType, null: false, description: '当前登录用户'
    add_field(GraphQL::Types::Relay::NodeField)

    def current_user
      User.first
    end
  end
end
