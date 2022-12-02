require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @user = User.create(
      name: "Test",
      email: "test@example.com",
      password: "password",
    )

  end
  it "タイトル,ユーザーIDがあれば有効な状態であること" do
    note = Note.new(
      title: "Test",
      user_id: @user.id
    )
    expect(note).to be_valid
  end

  it "タイトルがなければ無効な状態であること" do
    note = Note.new(title: nil)
    expect(note.valid?).to eq(false)
  end

  it "内容が１０００文字を超えれば無効な状態であること" do
    note = Note.new(body: "a" * 1001)
    expect(note.valid?).to eq(false)
  end

end
