module Inputs
  class UpdatePostInput < Types::BaseInputObject
    def self.model_scope
      :post
    end

    description "更新文章"
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :desc, String, required: false
  end
end
