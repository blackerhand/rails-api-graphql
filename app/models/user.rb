# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                   | Type               | Attributes
# ---------------------- | ------------------ | ---------------------------
# **`id`**               | `bigint`           | `not null, primary key`
# **`email`**            | `string(100)`      |
# **`nickname`**         | `string(20)`       |
# **`code`**             | `string(6)`        |
# **`password_digest`**  | `string`           |
# **`created_user_id`**  | `bigint`           |
# **`updated_user_id`**  | `bigint`           |
# **`disabled_at`**      | `datetime`         |
# **`created_at`**       | `datetime`         | `not null`
# **`updated_at`**       | `datetime`         | `not null`
#
class User < ApplicationRecord
  has_secure_password
end
