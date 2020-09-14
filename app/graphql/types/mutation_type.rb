module Types
  class MutationType < Types::BaseObject
    field :user_sign_in, mutation: Mutations::User::SignIn do
      argument :input, Inputs::User::SignIn, required: true
    end

    field :user_sign_up, mutation: Mutations::User::SignUp do
      argument :input, Inputs::User::SignUp, required: true
    end

    field :post_create, mutation: Mutations::Post::Create do
      argument :input, Inputs::Post::Create, required: true
    end

    field :post_update, mutation: Mutations::Post::Update do
      argument :input, Inputs::Post::Update, required: true
    end
  end
end
