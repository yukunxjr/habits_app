FactoryBot.define do
  factory :skill do
    sequence(:name) { |n| "Test#{n}" }
    association :user
  end
end
