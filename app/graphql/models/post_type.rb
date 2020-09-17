module Models
  class PostType < Types::BaseObject
    graphql_name 'Post'

    global_id_field :id
    field :title, String, null: false
    field :desc, String, null: false
  end
end
