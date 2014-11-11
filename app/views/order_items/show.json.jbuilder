json.extract! @order_item, :id, :name, :price, :special_requests

json.order_item_options @order_item.order_item_options, :id, :name, :price
