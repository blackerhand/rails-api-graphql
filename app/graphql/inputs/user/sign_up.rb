module Inputs
  module User
    class SignUp < Inputs::BaseInputObject
      description '注册参数'

      argument :email, String, required: true
      argument :passwd, String, required: true
      argument :nickname, String, required: true
    end
  end
end
