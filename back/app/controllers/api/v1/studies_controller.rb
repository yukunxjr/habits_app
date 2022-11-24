class Api::V1::StudiesController < ApplicationController
    def index
        # 現在のユーザーの情報
        user = Study.all.where(user_id: current_user)
        # 総学習時間合計
            all = user.sum(:time)
        # 今月の学習時間合計
            month = user.where(date: Time.current.all_month).sum(:time)
        # 今週の学習時間合計
            week = user.where(date: Time.current.all_week).sum(:time)
        # 今日の学習時間合計
            day = user.where(date: Date.today).sum(:time)
        
        render json: { "all" => all, "month" => month, "week" => week, "day" => day }
    end
    
    def create
        @study = Study.new(study_params)

        if @study.save
            render json: @study
        else
            render json: @study.errors
        end

        @study.save
    end
    
    private 
    
    def study_params
        params.require(:study).permit(:time, :date, :skill_id).merge(user_id: current_user.id)
    end

end
