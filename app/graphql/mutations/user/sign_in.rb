module Mutations
  module User
    class SignIn < BaseMutation
      field :user, Models::UserType, null: true

      def resolve(email:, passwd:)
        @user = ::User.find_by!(email: email)
        raise SignError, :passwd_error unless @user.authenticate(passwd)

        context[:current_user] = @user
        { user: @user }
      end
    end
  end
end
