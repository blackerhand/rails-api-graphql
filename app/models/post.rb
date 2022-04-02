# ## Schema Information
#
# Table name: `posts`
#
# ### Columns
#
# Name                   | Type               | Attributes
# ---------------------- | ------------------ | ---------------------------
# **`id`**               | `bigint`           | `not null, primary key`
# **`title`**            | `string(255)`      |
# **`desc`**             | `string(255)`      |
# **`created_user_id`**  | `bigint`           |
# **`updated_user_id`**  | `bigint`           |
# **`disabled_at`**      | `datetime`         |
# **`created_at`**       | `datetime`         | `not null`
# **`updated_at`**       | `datetime`         | `not null`
#
class Post < ApplicationRecord
  include Disable
end
