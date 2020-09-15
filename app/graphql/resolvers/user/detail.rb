module Resolvers
  module User
    class Detail < Resolvers::Base
      type Models::UserType, null: false

      argument :node_id, ID, required: true, loads: Models::UserType

      def resolve(node:)
        node
      end
    end
  end
end
