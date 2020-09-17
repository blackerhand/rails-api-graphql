module Inputs
  module User
    class SignIn < Types::BaseInputObject
      argument :email, String, required: true
      argument :passwd, String, required: true
    end
  end
end
