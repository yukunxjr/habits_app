class Api::V1::PlansController < ApplicationController
    before_action :authenticate_user!

    def index
        plans = Plan.all.where(user_id: current_user.id)
        render json: plans
    end

    def create
        plan = Plan.new(plan_params)
        if plan.save
            render json: plan
        end
    end
    
    def destroy
        @plan = Plan.find(params[:id])
        if @plan.destroy
            render json: @plan
        else
            render json: @plan.errors
        end
    end
    
    private
  
    def plan_params
        params.require(:plan).permit(:content).merge(user_id: current_user.id)
    end
end
