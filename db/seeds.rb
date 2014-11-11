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
MenuOption.delete_all
MenuOptionsCategory.delete_all

u1 = User.create(email: "test1@test.com", password_digest: "test1", access_token: "access1234", token_scope: "session", token_created_at: Date.today(), token_expired_at: Date.today() )

o1 = Order.create(user_id: u1.id, price: 1000.99, street: "57 Arch", city: "Westborough", state: "MA", phone: "508-836-2285")
o2 = Order.create(price: 50.99, street: "57 Arch", city: "Westborough", state: "MA", zipcode: "01581", phone: "508-836-2285")



oi1 = OrderItem.create(name: "The Sommerville", price: 6.75)
oi2 = OrderItem.create(name: "Small Bagel Box (12 bagels)", price: 12.00)
oi3 = OrderItem.create(name: "Hot Coffee", price: 0.00)

oio1 = OrderItemOption.create(name: "Smoked Salmon", price: 3.50, order_item_id: oi1.id)
oio2 = OrderItemOption.create(name: "Whole Wheat Bagel", price: 0.00, order_item_id: oi1.id)
oio3 = OrderItemOption.create(name: "Small", price: 2.00, order_item_id: oi3.id)

# Find ID by name
def get_id(model, name)
  return model.find_by_name(name).id
end

# Create Menu Items
def create_menu_item_seeds(list, menu_belongs_to)
  menu_id = get_id(Menu, menu_belongs_to)
  list.each do |name, price|
    MenuItem.create(name: name, price: price.to_d, menu_id: menu_id)
  end
end

# Create Menu Options
def create_menu_option_seeds(list, menu_options_category_belongs_to)
  menu_options_category_id = get_id(MenuOptionsCategory, menu_options_category_belongs_to)
  list.each do |name, price|
    MenuOption.create(name: name, price: price.to_d, menu_options_category_id: menu_options_category_id)
  end
end

# Get different prices for a specific list of options to save into a new array of options for a different category
def get_prices(list, prices)
  list_with_prices = []
  i = 0
  while i < list.length
    list_with_prices.push([list[i][0], prices[i].to_d])
    i += 1
  end
  return list_with_prices
end

# MENU
menu_list = [
  "Sandwiches",
  "Catering",
  "Beverages",
]

# MENU OPTIONS CATEGORIES
categories_list = [
  "Beverages",
  "Bagels",
  "Bagel Boxes",
  "Vegetables",
  "Toppings",
  "Cream Cheese",
  "Cream Cheese - Catering",
  "Cheese",
  "Protein"
]

# MENU ITEMS
sandwiches_list = [
  ["The Somerville", 6.75],
  ["The North End", 6.50],
  ["The South End", 6.50],
  ["The Hub", 6.00],
  ["The Brookline", 7.50],
  ["Build Your Own", 0.00]
]

catering_items_list = [
  ["Small Bagel Box (12 bagels)", 0.00],
  ["Large Bagel Box (18 bagels)", 0.00],
  ["Cream Cheese (catering size)", 0.00],
  ["Party Box (25 bagels, plus plain and chive cream cheeses)", 50.00],
]

beverages_list = [
  ["Fountain Soda", 0.00],
  ["Hot Coffee", 0.00],
  ["Latte", 0.00],
]


# MENU OPTIONS
beverages_options = [
  ["Small Fountain Soda", 2.75],
  ["Small Hot Coffee", 2.00],
  ["Small Latte", 3.50],
  ["Large Fountain Soda", 3.50],
  ["Large Hot Coffee", 2.50],
  ["Large Latte", 4.25]
]

bagel_boxes_options = [
  ["Small Plain", 12.00],
  ["Small Variety", 15.00],
  ["Small Single-Variety", 15.00],
  ["Large Plain", 18.00],
  ["Large Variety", 20.00],
  ["Large Single-Variety", 20.00]
]

bagels = [
  ["Plain", 2.50],
  ["Sesame", 3.00],
  ["Poppy Seed", 3.00],
  ["Onion", 3.00],
  ["Whole Wheat", 3.00],
  ["Cinnamon Raisin", 3.00]
]

vegetables = [
  ["Tomato", 0.00],
  ["Cucumber", 0.00],
  ["Red Onion", 0.00],
  ["Cole Slaw", 0.00],
  ["Avocado", 2.00],
  ["Sprouts", 0.50]
]

toppings = [
  ["Mayo", 0.50],
  ["Garlic", 0.50],
  ["Mustard", 0.50],
  ["Spicy Mustard", 0.50]
]

cream_cheeses = [
  ["Plain", 1.50],
  ["Chive", 1.50],
  ["Tofutti (vegetarian)", 2.00],
  ["Salmon Spread", 2.50]
]

# Create Cream Cheeses list with Catering prices
cream_cheeses_catering = get_prices(cream_cheeses, [4.00, 4.50, 4.50, 5.50])

cheeses = [
  ["Asiago", 0.50],
  ["Provolone", 0.50],
  ["Swiss", 0.50],
  ["Cheddar", 0.50]
]

proteins = [
  ["Turkey", 2.00],
  ["Smoked Salmon", 3.50],
  ["Roast Beef", 2.00],
  ["Corned Beef", 3.00]
]

# Create Menu
menu_list.each do |name|
  Menu.create(name: name)
end

# Create Categories
categories_list.each do |name|
  MenuOptionsCategory.create(name: name)
end

# Create Menu Items associated with corresponding Menu ID
create_menu_item_seeds(sandwiches_list, "Sandwiches")
create_menu_item_seeds(catering_items_list, "Catering")
create_menu_item_seeds(beverages_list, "Beverages")

# Create Menu Options associated with corresponding Menu Options Category
create_menu_option_seeds(beverages_options, "Beverages")
create_menu_option_seeds(bagel_boxes_options, "Bagel Boxes")
create_menu_option_seeds(bagels, "Bagels")
create_menu_option_seeds(vegetables, "Vegetables")
create_menu_option_seeds(toppings, "Toppings")
create_menu_option_seeds(cream_cheeses, "Cream Cheese")
create_menu_option_seeds(cream_cheeses_catering, "Cream Cheese - Catering")
create_menu_option_seeds(cheeses, "Cheese")
create_menu_option_seeds(proteins, "Protein")




