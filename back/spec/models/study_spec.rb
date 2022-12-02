require 'rails_helper'

RSpec.describe Study, type: :model do
  before do
    @user = User.create(
      name: "Test",
      email: "test@example.com",
      password: "password",
    )
    @skill = Skill.create(
      name: "Test1",
      user_id: @user.id,
    )
  end

  it "日付、時間、スキルID、ユーザーIDがあれば有効な状態であること" do
    study = Study.new(
      date: "2022-12-02",
      time: "3",
      skill_id: @skill.id,
      user_id: @user.id,
    )
    expect(study).to be_valid
  end

end
