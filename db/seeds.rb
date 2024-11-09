# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'

user_pictures = []

6.times do
  user_pictures << URI.parse(Faker::LoremFlickr.image).open
end

me = User.create!(
  email: "test@test.com",
  password: "password",
)

me.profile.update(first_name: "Test", last_name: "Account")

me.picture.attach(io: user_pictures[0], filename: "#{me.full_name}.jpg")

5.times do |i|
  user = User.create!(
    email: Faker::Internet.email,
    password: "password"
  )

  user.profile.update(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)

  user.picture.attach(io: user_pictures[i+1], filename: "#{user.full_name}.jpg")
end

10.times do |i|
  property = Property.create!(
    name: Faker::Lorem.unique.word,
    headline: Faker::Lorem.unique.sentence,
    description: Faker::Lorem.unique.paragraphs(number: 30).join(" "),
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country_code: "US",
    price: Money.from_amount((25..100).to_a.sample)
  )

  property.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "airbnb_#{i+1}.png")), filename: property.name)

  (1..5).to_a.sample.times do
    Review.create!(
      reviewable: property, 
      rating: (1..5).to_a.sample, 
      title: Faker::Lorem.word,
      body: Faker::Lorem.paragraph,
      user: User.all.sample
    )
  end
end