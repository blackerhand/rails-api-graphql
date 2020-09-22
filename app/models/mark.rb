# ## Schema Information
#
# Table name: `marks`
#
# ### Columns
#
# Name                              | Type               | Attributes
# --------------------------------- | ------------------ | ---------------------------
# **`id`**                          | `bigint`           | `not null, primary key`
# **`desc(评分理由)`**              | `string`           |
# **`score(评分)`**                 | `decimal(20, 6)`   |
# **`element_id`**                  | `bigint`           |
# **`created_user_id(创建人 ID)`**  | `bigint`           |
# **`updated_user_id(修改人 ID)`**  | `bigint`           |
# **`disabled_at(删除时间)`**       | `datetime`         |
# **`created_at`**                  | `datetime`         | `not null`
# **`updated_at`**                  | `datetime`         | `not null`
#
class Mark < ApplicationRecord
end
