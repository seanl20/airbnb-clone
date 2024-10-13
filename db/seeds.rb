# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do |i|
  property = Property.create!(
    name: Faker::Lorem.unique.word,
    headline: Faker::Lorem.unique.sentence,
    description: Faker::Lorem.unique.paragraphs(number: 30).join(" "),
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: "United States",
    price: Money.from_amount((25..100).to_a.sample)
  )

  property.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "airbnb_#{i+1}.png")), filename: property.name)

  (1..5).to_a.sample.times do
    Review.create!(
      reviewable: property, 
      rating: (1..5).to_a.sample, 
      title: Faker::Lorem.word,
      body: Faker::Lorem.paragraph
    )
  end
end