class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :name, comment: '名称'
      t.text :desc, comment: '简介'

      t.bigint :created_user_id, comment: '创建人 ID'
      t.bigint :updated_user_id, comment: '修改人 ID'
      t.datetime :disabled_at, comment: '删除时间'
      t.timestamps
    end
  end
end
