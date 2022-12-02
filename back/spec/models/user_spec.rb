require 'rails_helper'

RSpec.describe User, type: :model do

  it "名前、メール、パスワードがあれば有効な状態であること" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前がなければ無効な状態であること" do
    user = FactoryBot.build(:user, name: nil)
    expect(user.valid?).to eq(false)
  end 

  it "メールアドレスがなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: nil)
    expect(user.valid?).to eq(false)
  end 

  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:user, email: "test@example.com")
    user = User.new(
      name: "Smith",
      email: "test@example.com",
      password: "password"
    ) 
    expect(user.valid?).to eq(false)
  end
end
