require 'rails_helper'

RSpec.describe "Api::V1::Notes", type: :request do
  describe "GET /index" do
    context "ログイン済みユーザー" do
      before do
        @user = FactoryBot.create(:user)
      end
      it "JSON形式のレスポンスを返すこと" do
        sign_in @user
        get api_v1_notes_path
        expect(response.content_type).to include "application/json"
      end
    end
    context "未ログインユーザー" do
      it "401レスポンスを返すこと" do
        get api_v1_notes_path
        expect(response).to have_http_status "401"
      end
    end
  end
  describe "PUT /update" do
    it 'noteの編集を行う' do
      @user = create(:user)
      @note = create(:note, user_id: @user.id)

      put "/api/v1/notes/#{@note.id}", params: { note: {title: 'new-title'}  }
      json = JSON.parse(response.body)
      expect(json['data']['title']).to eq('new-title')
 end
  end
  describe "POST /create" do
    context "ログイン済みのユーザー" do
        before do
            @user = create(:user)
        end
        it "スキルを追加できること" do
            sign_in @user
            post "/api/v1/notes", :params => { :post => { :title => "test",:body => "testとは・・・" , :user_id => @user.id}}
            expect(response.content_type).to include "application/json"
        end
    end
    context "未ログインユーザー" do
        it "401レスポンスを返すこと" do
            post "/api/v1/notes", :params => { :post => { :title => "test"}}
            expect(response).to have_http_status "401"
        end
    end
  end
  describe "DELETE /destroy" do
    
  end
end
