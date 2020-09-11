module Types
  class MutationType < Types::BaseObject
    field :user_sign_in, mutation: Mutations::UserSignIn do
      argument :input, Inputs::Users::UserSignInInput, required: true
    end

    field :user_sign_up, mutation: Mutations::UserSignUp do
      argument :input, Inputs::Users::UserSignUpInput, required: true
    end

    field :create_post, mutation: Mutations::CreatePost do
      argument :input, Inputs::Posts::PostCreateInput, required: true
    end

    field :update_post, mutation: Mutations::UpdatePost do
      argument :input, Inputs::Posts::PostUpdateInput, required: true
    end
  end
end
