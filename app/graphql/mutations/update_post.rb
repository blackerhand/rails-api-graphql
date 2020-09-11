module Mutations
  class UpdatePost < BaseMutation
    null true

    field :post, Types::PostType, null: true

    def resolve(node:, title:, desc:)
      node.update!(title: title, desc: desc)

      { post: node }
    end
  end
end
