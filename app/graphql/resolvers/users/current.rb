module Resolvers
  module Users
    class Current < Resolvers::Base
      type Models::UserType, null: false

      def resolve
        context[:current_user]
      end
    end
  end
end
