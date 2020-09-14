module Inputs
  module User
    class SignIn < Inputs::BaseInputObject
      argument :email, String, required: true
      argument :passwd, String, required: true
    end
  end
end
