module Resolvers
  module User
    class Posts < Resolvers::Base
      type Interfaces::PostType.connection_type, null: false

      def resolve
        context[:current_user].posts.enabled
      end
    end
  end
end
