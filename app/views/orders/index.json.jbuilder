json.orders @orders do |order|
  json.id order.id
  json.price order.price
  json.street order.street
  json.city order.city
  json.state order.state
  json.zipcode order.zipcode
  json.phone order.phone
  json.order_items order.order_items, :id, :name, :price, :special_requests
end
