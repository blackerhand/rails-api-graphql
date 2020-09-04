module Types
  class MutationType < Types::BaseObject
    field :user_sign_in, mutation: Mutations::UserSignIn do
      argument :input, Inputs::UserSignInInput, required: true
    end
  end
end
