module Mutations
  class UserSignUp < BaseMutation
    null true

    field :user, Types::UserType, null: true

    def resolve(email:, passwd:, nickname:)
      @user = User.create!(email: email, nickname: nickname, password: passwd)

      { user: @user }
    end
  end
end
