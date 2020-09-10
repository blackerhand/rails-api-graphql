module Types
  class QueryType < Types::BaseObject
    field :current_user, Types::UserType, null: false, description: '当前登录用户' do
      guard -> (_obj, _args, ctx) {
        p ctx[:current_user]
        p 'yyyy ' * 200

        ctx[:current_user].present? }
    end

    def current_user
      User.first
    end
  end
end
