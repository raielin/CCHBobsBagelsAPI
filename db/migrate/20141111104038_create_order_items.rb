class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :name
      t.decimal :price
      t.text :special_requests
      t.belongs_to :order, index: true

      t.timestamps null: false
    end
  end
end
