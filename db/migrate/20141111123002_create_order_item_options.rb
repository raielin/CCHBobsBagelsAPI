class CreateOrderItemOptions < ActiveRecord::Migration
  def change
    create_table :order_item_options do |t|
      t.string :name
      t.decimal :price
      t.belongs_to :order_item, index: true, null: false

      t.timestamps null: false
    end
  end
end
