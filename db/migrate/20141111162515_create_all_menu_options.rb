class CreateAllMenuOptions < ActiveRecord::Migration
  def change
    create_table :all_menu_options do |t|
      t.belongs_to :menu_options_category, index: true
      t.string :name
      t.decimal :price, precision: 5, scale: 2
    end
  end
end
