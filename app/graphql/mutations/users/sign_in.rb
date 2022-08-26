module Mutations
  module Users
    class SignIn < BaseMutation
      field :user, Models::UserType, null: true

      def resolve(params, *_opts)
        @user = ::User.find_by!(email: params[:email])
        raise SignError, :passwd_error unless @user.authenticate(params[:password])

        context[:current_user] = @user
        { user: @user }
      end
    end
  end
end
