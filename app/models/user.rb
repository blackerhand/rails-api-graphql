# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                              | Type               | Attributes
# --------------------------------- | ------------------ | ---------------------------
# **`id`**                          | `bigint`           | `not null, primary key`
# **`email`**                       | `string(100)`      |
# **`nickname`**                    | `string(20)`       |
# **`code`**                        | `string(6)`        |
# **`password_digest`**             | `string`           |
# **`created_user_id(创建人 ID)`**  | `bigint`           |
# **`updated_user_id(修改人 ID)`**  | `bigint`           |
# **`disabled_at(删除时间)`**       | `datetime`         |
# **`created_at`**                  | `datetime`         | `not null`
# **`updated_at`**                  | `datetime`         | `not null`
#
class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def payload
    slice(:id)
  end

  def token
    Svc::JwtSignature.sign(payload)
  end
end
