FactoryBot.define do
  factory :profile do
    association :user
    address_1 { Faker::Address.street_address }
    address_2 { "MyString" }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country_code { Faker::Address.country_code }
    zip_code { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
