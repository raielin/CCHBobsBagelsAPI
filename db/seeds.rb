# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Order.delete_all
u1 = User.create(email: "test1@test.com", password_digest: "test1", access_token: "access1234", token_scope: "session", token_created_at: Date.today(), token_expired_at: Date.today() )


o1 = Order.create(user_id: u1.id, price: 1000.99, street: "57 Arch", city: "Westborough", state: "MA", phone: "508-836-2285")
o2 = Order.create(price: 50.99, street: "57 Arch", city: "Westborough", state: "MA", zipcode: "01581", phone: "508-836-2285")
