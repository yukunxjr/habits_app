FactoryBot.define do
  factory :study do
    date { "2022-12-02" }
    time { "10" }
    association :skill
    association :user
  end
end
