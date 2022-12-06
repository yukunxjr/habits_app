FactoryBot.define do
  factory :user, aliases: [:owner] do
    name { "Test" }
    email { "test@test.com" }
    password { "password" }
  end
end
