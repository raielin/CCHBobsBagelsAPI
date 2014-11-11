class MenuItem < ActiveRecord::Base
  belongs_to :menu
  # has_many :menu_options
end
