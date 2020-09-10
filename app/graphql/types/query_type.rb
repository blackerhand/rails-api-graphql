module Types
  class QueryType < Types::BaseObject
    field :current_user, Types::UserType, null: false, description: '当前登录用户'

    def current_user
      User.first
    end
  end
end
