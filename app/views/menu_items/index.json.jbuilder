json.menu_items @menu_items do |menu_item|
  json.id menu_item.id
  json.name menu_item.name
  json.price menu_item.price
end
