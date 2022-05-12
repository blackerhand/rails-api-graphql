module Inputs
  module User
    class Update < Types::BaseInputObject
      argument :passwd, String, required: false
      argument :nickname, String, required: false
      argument :avatar, Types::BlobImage, required: false
    end
  end
end
