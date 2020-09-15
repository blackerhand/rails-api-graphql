module Resolvers
  module User
    class List < Resolvers::Base
      type [Models::UserType], null: false

      def resolve
        ::User.all
      end
    end
  end
end
