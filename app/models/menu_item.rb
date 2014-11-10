class MenuItems < ActiveRecord::Base
  belongs_to :menu
  has_many :menu_item_options
end
