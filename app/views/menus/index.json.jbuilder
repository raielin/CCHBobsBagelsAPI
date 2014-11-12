json.menus @menus do |menu|
  json.id menu.id
  json.name menu.name
  json.menu_items menu.menu_items, :id, :name, :price
end
