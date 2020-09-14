module Models
  class UserType < Models::BaseType
    graphql_name 'User'

    global_id_field :id
    field :email, String, null: false
    field :nickname, String, null: false
    field :token, String, null: false
  end
end
