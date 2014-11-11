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
Menu.delete_all
MenuItem.delete_all
MenuItemOption.delete_all

u1 = User.create(email: "test1@test.com", password_digest: "test1", access_token: "access1234", token_scope: "session", token_created_at: Date.today(), token_expired_at: Date.today() )

o1 = Order.create(user_id: u1.id, price: 1000.99, street: "57 Arch", city: "Westborough", state: "MA", phone: "508-836-2285")
o2 = Order.create(price: 50.99, street: "57 Arch", city: "Westborough", state: "MA", zipcode: "01581", phone: "508-836-2285")



oi1 = OrderItem.create(name: "The Sommerville", price: 6.75)
oi2 = OrderItem.create(name: "Small Bagel Box (12 bagels)", price: 12.00)
oi3 = OrderItem.create(name: "Hot Coffee", price: 0.00)

oio1 = OrderItemOption.create(name: "Smoked Salmon", price: 3.50, order_item_id: oi1.id)
oio2 = OrderItemOption.create(name: "Whole Wheat Bagel", price: 0.00, order_item_id: oi1.id)
oio3 = OrderItemOption.create(name: "Small", price: 2.00, order_item_id: oi3.id)


menu_list = [
  "Sandwiches",
  "Catering",
  "Beverages",
]

sandwiches_list = [
  ["The Somerville", 6.75],
  ["The North End", 6.50],
  ["The South End", 6.50],
  ["The Hub", 6.00],
  ["The Brookline", 7.50],
  ["Build Your Own", 0.00]
]

catering_items_list = [
  ["Small Bagel Box (12 bagels)", 12.00],
  ["Large Bagel Box (18 bagels)", 18.00],
  ["Cream Cheese (catering size)", 0.00],
  ["Party Box (25 bagels, plus plain and chive cream cheeses)", 50.00],
]

beverages_list = [
  ["Fountain Soda", 0.00],
  ["Hot Coffee", 0.00],
  ["Latte", 0.00]
]

beverages_options = [
  "Small",
  "Large"
]

bagel_boxes_options = [
  "Plain",
  "Variety",
  "Single-Variety"
]

bagel_options = [
  "Plain",
  "Sesame",
  "Poppy Seed",
  "Onion",
  "Whole Wheat",
  "Cinnamon Raisin"
]

sandwich_options_vegetables = [
  "Tomato",
  "Cucumber",
  "Red Onion",
  "Cole Slaw",
  "Avocado",
  "Sprouts"
]

sandwich_options_toppings = [
  "Mayo",
  "Garlic",
  "Mustard",
  "Spicy Mustard"
]

cream_cheese_options = [
  "Plain",
  "Chive",
  "Tofutti (vegetarian)",
  "Salmon Spread"
]

sandwich_options_cheese = [
  "Asiago",
  "Provolone",
  "Swiss",
  "Cheddar"
]

sandwich_options_protein = [
  "Turkey",
  "Smoked Salmon",
  "Roast Beef",
  "Corned Beef"
]

def get_id(model, name)
  return model.find_by_name(name).id
end

def create_menu_item_seeds(list, menu_belongs_to)
  menu_id = get_id(Menu, menu_belongs_to)
  list.each do |name, price|
    MenuItem.create(name: name, price: price, menu_id: menu_id)
  end
end

def get_prices(list, prices)
  list_with_prices = []
  i = 0
  while i < list.length
    list_with_prices.push([list[i], prices[i]])
    i += 1
  end
  return list_with_prices
end

def create_menu_item_options_seeds(list, menu_item_belongs_to)
  menu_item_id = get_id(MenuItem, menu_item_belongs_to)
  list.each do |name, price|
    MenuItemOption.create(name: name, price: price, menu_id: menu_id)
  end
end

# def create_menu_item_options_seeds(list, menu_item_belongs_to, *prices)
#   menu_item_id = get_id(MenuItem, menu_item_belongs_to)
#   if prices != nil
#     list_with_prices = get_prices(list, prices)
#     list_with_prices.each do |name, price|
#       MenuItemOption.create(name: name, price: price, menu_item_id: menu_item_id)
#     end
#   else
#     list.each do |name, price|
#       MenuItemOption.create(name: name, price: price, menu_item_id: menu_item_id)
#     end
#   end
# end

menu_list.each do |name|
  Menu.create(name: name)
end

create_menu_item_seeds(sandwiches_list, "Sandwiches")

create_menu_item_seeds(catering_items_list, "Catering")

create_menu_item_seeds(beverages_list, "Beverages")


create_menu_item_options_seeds(beverages_options, "Fountain Soda")

