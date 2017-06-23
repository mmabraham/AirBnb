# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Spot.destroy_all
Review.destroy_all

User.create(username: 'Guest', password: 'password')

users = []
20.times do
  users << User.create(
    username: Faker::Internet.user_name,
    password: Faker::Internet.password
  )
end

# 30.times do
#   Spot.create(
#     spot_type: (%w{ full_home shared mattress_on_floor private }.sample),
#     title: Faker::Book.title,
#     description: Faker::Lorem.paragraph,
#     lat: Faker::Address.latitude,
#     lng: Faker::Address.longitude,
#     capacity: rand(1..15),
#     price: rand(1..999),
#     host_id: users.sample.id,
#     img: File.open('app/assets/images/background1 copy.jpg')
#   )
# end

spots = []
150.times do
  spots << Spot.create(
    spot_type: (%w{ full_home shared mattress_on_floor private }.sample),
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph,
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude,
    capacity: rand(1..15),
    price: rand(1..999),
    host_id: users.sample.id
  )
end

1000.times do
  Review.create(
    user_id: users.sample.id,
    spot_id: spots.sample.id,
    body: Faker::Lorem.paragraph,
    rating: rand(1..5)
  )

end
