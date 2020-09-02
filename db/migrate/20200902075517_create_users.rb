class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email,           limit: 100
      t.string :nickname,        limit: 20
      t.string :code,            limit: 6
      t.string :password_digest

      t.bigint :created_user_id
      t.bigint :updated_user_id
      t.datetime :disabled_at

      t.timestamps
    end
  end
end
