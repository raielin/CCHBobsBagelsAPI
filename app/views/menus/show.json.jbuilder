json.extract! @menu, :id, :name
json.menu_items @order.menu_items, :id, :name, :price
