FactoryBot.define do
  factory :reservation do
    association :user
    association :property
    
    checkin_date { Date.current }
    checkout_date { Date.current }
  end
end
