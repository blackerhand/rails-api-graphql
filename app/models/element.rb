# ## Schema Information
#
# Table name: `elements`
#
# ### Columns
#
# Name                              | Type               | Attributes
# --------------------------------- | ------------------ | ---------------------------
# **`id`**                          | `bigint`           | `not null, primary key`
# **`score(最终得分)`**             | `decimal(20, 6)`   |
# **`line_id`**                     | `bigint`           |
# **`post_id`**                     | `bigint`           |
# **`created_user_id(创建人 ID)`**  | `bigint`           |
# **`updated_user_id(修改人 ID)`**  | `bigint`           |
# **`disabled_at(删除时间)`**       | `datetime`         |
# **`created_at`**                  | `datetime`         | `not null`
# **`updated_at`**                  | `datetime`         | `not null`
#
class Element < ApplicationRecord
end
