module Mutations
  class UserSignIn < BaseMutation
    null true

    field :user, Types::UserType, null: true

    def resolve(email:, passwd:)
      @user = User.find_by(email: email)

      raise SignError, '密码不正确' if @user.nil?
      raise SignError, '密码不正确' unless @user.authenticate(passwd)

      { user: @user }
    end
  end
end
