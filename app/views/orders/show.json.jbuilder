json.extract! @order, :id, :price, :street, :city, :state, :zipcode, :phone

json.order_items @order.order_items, :id, :name, :price, :special_requests

