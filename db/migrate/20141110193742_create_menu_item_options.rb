class CreateMenuItemOptions < ActiveRecord::Migration
  def change
    create_table :menu_item_options do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.boolean :included
      t.belongs_to :menu_item, index: true
    end
  end
end
