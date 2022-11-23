class Api::V1::StudiesController < ApplicationController
    def index
        # @skills = Skills.all.where(user_id: current_user)
        # @study = Study.new

        # 学習時間合計
        @studies = Study.all.where(user_id: current_user).sum(:time)
        render json: @studies
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
        params.require(:study).permit(:time, :date, :skills_id).merge(user_id: current_user.id)
    end

end
