module Inputs
  module Users
    class Update < Types::BaseInputObject
      argument :password, String, required: false
      argument :nickname, String, required: false
      argument :avatar, Types::BlobImage, required: false
    end
  end
end
