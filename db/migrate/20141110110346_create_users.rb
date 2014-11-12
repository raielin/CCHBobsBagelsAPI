class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :access_token
      t.string :token_scope
      t.datetime :token_expired_at
      t.datetime :token_created_at
      t.string :name

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :access_token, unique: true
  end
end
