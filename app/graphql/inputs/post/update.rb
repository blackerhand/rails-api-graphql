module Inputs
  module Post
    class Update < Inputs::BaseInputObject
      argument :node_id, ID, required: true, loads: Models::PostType
      argument :title, String, required: false
      argument :desc, String, required: false
    end
  end
end
