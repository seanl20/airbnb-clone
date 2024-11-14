FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "foo_#{i}@example.com"}
    password { "password" }
  end

  trait :host do
    role { Constants::Users::HOST }
  end
end
