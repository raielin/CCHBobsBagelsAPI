json.order_item_options @order_item_options do |order_item_option|
  json.id order_item_option.id
  json.name order_item_option.name
  json.price order_item_option.price
  json.order_item_id order_item_option.order_item_id
end
