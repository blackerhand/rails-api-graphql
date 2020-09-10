class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :desc

      t.bigint :created_user_id
      t.bigint :updated_user_id
      t.datetime :disabled_at

      t.timestamps
    end
  end
end
