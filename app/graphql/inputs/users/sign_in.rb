module Inputs
  module Users
    class SignIn < Types::BaseInputObject
      argument :email, String, required: true
      argument :password, String, required: true
    end
  end
end
