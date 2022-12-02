require 'rails_helper'

RSpec.describe Skill, type: :model do
  before do
    FactoryBot.create(:user)
  end
  
  it "ユーザーIDがなければ無効な状態であること" do
    skill = Skill.new(user_id: nil)
    expect(skill.valid?).to eq(false)
  end

  it "スキル名がなければ無効な状態であること" do
    skill = Skill.new(name: nil)
    expect(skill.valid?).to eq(false)
  end

  it "名前が２０文字を超えれば無効な状態であること" do
    skill = Skill.new(name: "a" * 21)
    expect(skill.valid?).to eq(false)
  end

  it "ユーザー単位では重複したプロジェクト名を許可しないこと" do
    skill = Skill.new(name: "test")
    newSkill = Skill.new(name: "test")
    expect(newSkill.valid?).to eq(false)
  end

end
