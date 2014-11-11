# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Order.delete_all
OrderItem.delete_all
OrderItemOption.delete_all
User.delete_all

u1 = User.create(email: "test1@test.com", password_digest: "test1", access_token: "access1234", token_scope: "session", token_created_at: Date.today(), token_expired_at: Date.today() )


o1 = Order.create(user_id: u1.id, price: 1000.99, street: "57 Arch", city: "Westborough", state: "MA", phone: "508-836-2285")
o2 = Order.create(price: 50.99, street: "57 Arch", city: "Westborough", state: "MA", zipcode: "01581", phone: "508-836-2285")



oi1 = OrderItem.create(name: "The Sommerville", price: 6.75)
oi2 = OrderItem.create(name: "Small Bagel Box (12 bagels)", price: 12.00)
oi3 = OrderItem.create(name: "Hot Coffee", price: 0.00)

oio1 = OrderItemOption.create(name: "Smoked Salmon", price: 3.50, order_item_id: oi1.id)
oio2 = OrderItemOption.create(name: "Whole Wheat Bagel", price: 0.00, order_item_id: oi1.id)
oio3 = OrderItemOption.create(name: "Small", price: 2.00, order_item_id: oi3.id)

