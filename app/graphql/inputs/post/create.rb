module Inputs
  module Post
    class Create < Inputs::BaseInputObject
      description '创建文章参数'
      argument :title, String, required: true
      argument :desc, String, required: false
    end
  end
end
