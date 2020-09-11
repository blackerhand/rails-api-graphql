module Inputs
  module Posts
    class PostCreateInput < Types::BaseInputObject
      def self.model_scope
        :post
      end

      description "创建文章"
      argument :title, String, required: true
      argument :desc, String, required: false
    end
  end
end
