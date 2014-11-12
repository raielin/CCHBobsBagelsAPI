json.orders @orders do |order|
  json.id order.id
  json.price order.price
  json.street order.street
  json.city order.city
  json.state order.state
  json.zipcode order.zipcode
  json.phone order.phone
  json.order_items order.order_items do |order_item|
    json.id order_item.id
    json.name order_item.name
    json.price order_item.price
    json.special_requests order_item.special_requests
    json.order_item_options order_item.order_item_options, :name, :price
  end
end
