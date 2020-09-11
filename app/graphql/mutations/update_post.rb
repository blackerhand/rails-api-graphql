module Mutations
  class UpdatePost < BaseMutation
    field :post, Types::PostType, null: true

    def resolve(title:, desc:, id:)
      debugger

      @post = Post.find(id)
      @post.update!(title: title, desc: desc)

      { post: @post }
    end
  end
end
