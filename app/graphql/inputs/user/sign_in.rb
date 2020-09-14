module Inputs
  module User
    class SignIn < Types::BaseInputObject
      def self.model_scope
        :user
      end

      description "登录参数"

      argument :email, String, required: true
      argument :passwd, String, required: true
    end
  end
end
