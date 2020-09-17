module Inputs
  module Post
    class Create < Types::BaseInputObject
      argument :title, String, required: true
      argument :desc, String, required: false
    end
  end
end
