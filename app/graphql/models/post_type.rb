module Models
  class PostType < Models::BaseType
    graphql_name 'Post'

    global_id_field :id
    field :title, String, null: false
    field :desc, String, null: false
  end
end
