class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.string :desc, comment: '评分理由'
      t.decimal :score, precision: 20, scale: 6, comment: '评分'

      t.bigint :element_id

      t.bigint :created_user_id, comment: '创建人 ID'
      t.bigint :updated_user_id, comment: '修改人 ID'
      t.datetime :disabled_at, comment: '删除时间'
      t.timestamps
    end
  end
end
