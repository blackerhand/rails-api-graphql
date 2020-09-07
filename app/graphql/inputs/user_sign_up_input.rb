module Inputs
  class UserSignUpInput < Types::BaseInputObject
    description "登录参数"

    argument :email, String, required: true
    argument :passwd, String, required: true
    argument :nickname, String, required: true
  end
end
