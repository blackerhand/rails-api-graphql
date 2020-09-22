class CreateElements < ActiveRecord::Migration[6.0]
  def change
    create_table :elements do |t|
      t.decimal :score, precision: 20, scale: 6, comment: '最终得分'

      t.bigint :line_id
      t.bigint :post_id

      t.bigint :created_user_id, comment: '创建人 ID'
      t.bigint :updated_user_id, comment: '修改人 ID'
      t.datetime :disabled_at, comment: '删除时间'
      t.timestamps
    end
  end
end
