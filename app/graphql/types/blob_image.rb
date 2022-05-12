module Types
  class BlobImage < GraphQL::Schema::Scalar
    def self.coerce_input(value, ctx)
      blob = ActiveStorage::Blob.where(id: value, created_user_id: ctx[:current_user].try(:id)).first
      raise GraphQL::CoercionError, 'blob not exists' unless blob.present? && blob.attachments.blank?
      raise GraphQL::CoercionError, 'blob not a image' unless blob.content_type.include?('image')

      blob
    end

    def self.coerce_result(value, _ctx)
      value
    end
  end
end
