FactoryBot.define do
  factory :property do
    association :user
    name { Faker::Lorem.unique.word }
    headline { Faker::Lorem.unique.sentence }
    description { Faker::Lorem.unique.paragraph }
    address_1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country_code { Faker::Address.country_code }
    reviews_count { 0 }
    average_rating { 0 }
  end
end
