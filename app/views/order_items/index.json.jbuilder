json.order_items @order_items do |order_item|
  json.id order_item.id
  json.name order_item.name
  json.price order_item.price
  json.special_requests order_item.special_requests
end