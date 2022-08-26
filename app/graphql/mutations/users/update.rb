module Mutations
  module Users
    class Update < BaseMutation
      null true

      field :user, Models::UserType, null: true

      def resolve(params, *_opts)
        context[:current_user].update!(params)
        { user: context[:current_user] }
      end
    end
  end
end
