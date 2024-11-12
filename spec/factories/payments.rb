FactoryBot.define do
  factory :payment do
    association :reservation
  end
end
