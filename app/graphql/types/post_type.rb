module Types
  class PostType < Types::BaseObject
    graphql_name 'Post'
    description '文章'

    field :title, String, null: false
    field :desc, String, null: false
  end
end
