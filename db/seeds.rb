# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Complain.destroy_all
Company.destroy_all
User.destroy_all

20.times do |i|
  c = Company.new(
    name: Faker::Company.name,
    description: Faker::Lorem.sentence,
    location: "#{Faker::GameOfThrones.city}, #{Faker::ElderScrolls.region}",
  )
  c.save
end

30.times do |i|
  u = User.new(
    email: Faker::Internet.email,
    password: "123456"
  )
  u.save
end

250.times do |i|
  c = Complain.new(
    description: Faker::Lorem.sentence,
    user_id: User.order("RANDOM()").limit(1).first.id,
    company_id: Company.order("RANDOM()").limit(1).first.id
  )
  c.save
end
