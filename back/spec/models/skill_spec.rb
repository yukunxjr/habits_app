require 'rails_helper'

RSpec.describe Skill, type: :model do
  before do
    @user = User.create(
      name: "Test",
      email: "test@example.com",
      password: "password",
    )
  end
  it "ユーザーIDがなければ無効な状態であること" do
    skill = Skill.new(user_id: nil)
    expect(skill.valid?).to eq(false)
  end

  it "名前が２０文字を超えれば無効な状態であること" do
    skill = Skill.new(name: "a" * 21)
    expect(skill.valid?).to eq(false)
  end
end
