module Inputs
  module Post
    class Create < Inputs::BaseInputObject
      argument :title, String, required: true
      argument :desc, String, required: false
    end
  end
end
