FactoryBot.define do
  factory :user do
    name { "Test" }
    # sequence(:email) { |n| "test#{n}@example.com" }
    email { "test@test.com" }
    password { "password" }
  end
end
