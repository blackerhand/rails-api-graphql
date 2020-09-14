module Inputs
  module User
    class SignUp < Inputs::BaseInputObject
      argument :email, String, required: true
      argument :passwd, String, required: true
      argument :nickname, String, required: true
    end
  end
end
