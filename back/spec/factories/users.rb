FactoryBot.define do
  factory :user do
    name { "Test" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
  end
end
