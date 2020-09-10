module Types
  class MutationType < Types::BaseObject
    field :user_sign_in, mutation: Mutations::UserSignIn do
      argument :input, Inputs::UserSignInInput, required: true
    end

    field :user_sign_up, mutation: Mutations::UserSignUp do
      argument :input, Inputs::UserSignUpInput, required: true
    end

    field :create_post, mutation: Mutations::CreatePost do
      argument :input, Inputs::CreatePostInput, required: true
    end
  end
end
