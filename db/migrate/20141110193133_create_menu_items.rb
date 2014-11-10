class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.belongs_to :menu, index: true
    end
  end
end
