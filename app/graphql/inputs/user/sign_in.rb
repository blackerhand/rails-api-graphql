module Inputs
  module User
    class SignIn < Inputs::BaseInputObject
      description '登录参数'

      argument :email, String, required: true
      argument :passwd, String, required: true
    end
  end
end
