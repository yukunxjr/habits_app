FactoryBot.define do
  factory :note do
    sequence(:title) { |n| "Test #{n}" }
    sequence(:body) { |n| "Test #{n}とは・・・・" }
    association :owner
  end
end
