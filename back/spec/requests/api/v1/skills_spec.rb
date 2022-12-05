require 'rails_helper'

RSpec.describe "Api::V1::Skills", type: :request do
  describe "GET /index" do
    context "ログイン済みのユーザー" do
        before do
            @user = create(:user)
            sign_in @user
        end
        it "JSON形式のレスポンスを返すこと" do
            get api_v1_skills_path
            expect(response.content_type).to include "application/json"
        end
    end
    context "未ログインユーザー" do
        it "401レスポンスを返すこと" do
            get api_v1_skills_path
            expect(response).to have_http_status "401"
        end
    end
  end
  describe "POST /create" do
    context "ログイン済みのユーザー" do
        before do
            @user = create(:user)
        end
        it "スキルを追加できること" do
            sign_in @user
            post "/api/v1/skills", :params => { :post => { :name => "test", :user_id => @user.id}}
            expect(response.content_type).to include "application/json"
        end
    end
    context "未ログインユーザー" do
        it "スキルを追加できないこと" do
            post "/api/v1/skills", :params => { :post => { :name => "test"}}
            expect(response).to have_http_status "401"
        end
    end
  end
end
