class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 100
      t.string :nickname, limit: 20
      t.string :code, limit: 6
      t.string :password_digest

      t.integer :like_reports_count, default: 0
      t.integer :like_votes_count, default: 0
      t.integer :star_comments_count, default: 0

      t.integer :followers_count, default: 0
      t.integer :following_count, default: 0

      t.bigint :created_user_id, comment: '创建人 ID'
      t.bigint :updated_user_id, comment: '修改人 ID'
      t.datetime :disabled_at, comment: '删除时间'
      t.timestamps
    end
  end
end
