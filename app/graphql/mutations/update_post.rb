module Mutations
  class UpdatePost < BaseMutation
    null true

    field :post, Types::PostType, null: true

    def resolve(post:, title:, desc:)
      post.update!(title: title, desc: desc)

      { post: post }
    end
  end
end
