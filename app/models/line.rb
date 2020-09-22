# ## Schema Information
#
# Table name: `lines`
#
# ### Columns
#
# Name                              | Type               | Attributes
# --------------------------------- | ------------------ | ---------------------------
# **`id`**                          | `bigint`           | `not null, primary key`
# **`name(标题)`**                  | `string`           |
# **`desc(说明)`**                  | `text`             |
# **`collection_id`**               | `bigint`           |
# **`created_user_id(创建人 ID)`**  | `bigint`           |
# **`updated_user_id(修改人 ID)`**  | `bigint`           |
# **`disabled_at(删除时间)`**       | `datetime`         |
# **`created_at`**                  | `datetime`         | `not null`
# **`updated_at`**                  | `datetime`         | `not null`
#
class Line < ApplicationRecord
end
