require 'rails_helper'

RSpec.describe Api::V1::SkillsController, type: :controller do
    describe "index" do
        context "認証済みのユーザー" do
            before do
                @user = FactoryBot.create(:user)
            end
            it "JSON形式のレスポンスを返すこと" do
                sign_in @user
                get :index
                expect(response.content_type).to include "application/json"
            end
        end
        context "未ログインユーザー" do
            it "401レスポンスを返すこと" do
                get :index
                expect(response).to have_http_status "401"
            end
        end
    end
    describe "create" do
        before do
            @user = FactoryBot.create(:user)
        end
        it "JSON形式のレスポンスを返すこと" do
            sign_in @user
            post :create, format: :json, params: { name: "Test1", user_id: @user.id }
            expect(response.content_type).to include "application/json"
        end
    end
    
end

