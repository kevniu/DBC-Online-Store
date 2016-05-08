# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

3.times do
  Category.create(name: Faker::Commerce.department)
end

20.times do
  Product.create(name: Faker::Commerce.product_name, quantity: rand(10), description: Faker::Lorem.sentence, price: rand(1000), category_id: rand(1..3))
end

User.create(name: 'tom', email: 'tom@tom.com', password: 'tomtom', role: User.roles[:customer])

User.create(name: 'tim', email: 'krispyshoppe@gmail.com', password: 'timtim', role: User.roles[:admin])


Cart.create(user_id: 1)
Cart.create(user_id: 2)
