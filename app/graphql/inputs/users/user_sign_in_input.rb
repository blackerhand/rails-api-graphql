module Inputs
  module Users
    class UserSignInInput < Types::BaseInputObject
      def self.model_scope
        :user
      end

      description "登录参数"

      argument :email, String, required: true
      argument :passwd, String, required: true
    end
  end
end
