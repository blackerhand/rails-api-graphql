module Inputs
  module User
    class SignUp < Types::BaseInputObject
      argument :email, String, required: true
      argument :password, String, required: true
      argument :nickname, String, required: true
      argument :avatar, Types::BlobImage, required: false
    end
  end
end
