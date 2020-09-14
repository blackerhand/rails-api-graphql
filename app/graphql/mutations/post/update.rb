module Mutations
  module Post
    class Update < BaseMutation
      null true

      field :post, Models::PostType, null: true

      def resolve(node:, title:, desc:)
        node.update!(title: title, desc: desc)
        { post: node }
      end
    end
  end
end
