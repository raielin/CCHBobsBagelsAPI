class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :access_token, null: false
      t.string :token_scope, null: false
      t.datetime :token_expired_at, null: false
      t.datetime :token_created_at, null: false
      t.string :name

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :access_token, unique: true
  end
end
