# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times do
#   Campaign.create(
#     reward_type: ["Paid Job", "Local Swap"].sample,
#     title: Faker::Name.title,
#     product: Faker::Commerce.product_name,
#     goal: Faker::Hacker.verb,
#     start_time: Faker::Date.backward(30),
#     end_time: Faker::Date.forward(30),
#     description: Faker::Lorem.paragraph,
#     instructions: Faker::Lorem.paragraph,
#     pics_to_upload: Faker::Number.between(1, 5),
#     pics_to_post: Faker::Number.between(1, 5),
#     budget: Faker::Number.between(0, 20000)
#     )

#   Place.create(
#     name: Faker::Address.street_address,
#     )

#   Tag.create(
#     name: Faker::Lorem.words(4),
#     )

#   Influencer.create(
#     username: Faker::Name.first_name,
#     followers: Faker::Number.between(500, 200000),
#     avg_photo_comments: Faker::Number.between(10, 2000),
#     avg_photo_likes: Faker::Number.between(20, 4000),
#     address: Faker::Address.street_address,
#     number: Faker::PhoneNumber.cell_phone,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     photo: Faker::Avatar.image
#     )

#   Business.create(
#     name: Faker::Name.name,
#     address: Faker::Address.street_address,
#     category: Faker::Commerce.department,
#     tva: Faker::Number.number(10),
#     contact_name: Faker::Name.name,
#     photo: Faker::Avatar.image
#     )

# end

# Campaign.all.each do |campaign|
#   if campaign.reward_type == "Local Swap"
#     campaign.target_location = ["Parvis Saint Gilles, Bruxelles", "Rue des Tanneurs, Bruxelles", "Grand-Place, Bruxelles", "Place Jourdan, Bruxelles", "Place de la Bourse, Bruxelles", "Place Eugène Flagey, Ixelles", "Place du Luxembourg, Ixelles", "Place Stéphanie, Ixelles"].sample
#   end
#   campaign.save
# end
