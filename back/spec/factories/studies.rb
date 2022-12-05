FactoryBot.define do
  factory :study do
    date { "2022-12-02" }
    time { "10" }
    user { skill.user }
    association :skill
  end
end
