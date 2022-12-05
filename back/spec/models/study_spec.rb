require 'rails_helper'

RSpec.describe Study, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @skill = FactoryBot.create(:skill, user_id: @user.id)
  end

  it "日付、時間、スキルID、ユーザーIDがあれば有効な状態であること" do
    expect(FactoryBot.build(:study, skill_id: @skill.id, user_id: @user.id )).to be_valid
  end

  it "学習時間の合計値が24時間/1日を超えれば無効であること" do
    study = FactoryBot.build(:study, time: 25)
    expect(study.valid?).to eq(false) 
  end
  
end
