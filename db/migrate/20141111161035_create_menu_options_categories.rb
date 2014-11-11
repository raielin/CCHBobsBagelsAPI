class CreateMenuOptionsCategories < ActiveRecord::Migration
  def change
    create_table :menu_options_categories do |t|
      t.string :name
    end
  end
end
