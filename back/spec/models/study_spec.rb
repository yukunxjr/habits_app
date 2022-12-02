require 'rails_helper'

RSpec.describe Study, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @skill = FactoryBot.create(:skill, user_id: @user.id)
  end

  it "日付、時間、スキルID、ユーザーIDがあれば有効な状態であること" do
    study = FactoryBot.create(:study)
    expect(study).to be_valid
  end

  it "学習時間の合計値が24時間/1日を超えれば無効であること" do
    study = FactoryBot.build(:study, time: 25)
    expect(study.valid?).to eq(false) 
  end
  
end
