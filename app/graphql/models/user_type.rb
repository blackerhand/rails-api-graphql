module Models
  class UserType < Types::BaseObject
    graphql_name 'User'
    description '用户'

    global_id_field :id

    field :email, String, null: false
    field :nickname, String, null: false
    field :token, String, null: false
  end
end
