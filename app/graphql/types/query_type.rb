module Types
  class QueryType < Types::BaseObject
    field :current_user, Types::UserType, null: false, description: '当前登录用户' do
      guard -> (_obj, _args, ctx) { ctx[:current_user].present? }
    end

    def current_user
      User.first
    end
  end
end
