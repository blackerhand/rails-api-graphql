module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType, null: true

    def resolve(title:, desc:)
      @post = Post.create!(title: title, desc: desc)
      { post: @post }
    end
  end
end
