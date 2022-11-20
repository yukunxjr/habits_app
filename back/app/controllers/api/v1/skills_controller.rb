class Api::V1::SkillsController < ApplicationController
      def index
    @slills = Slill.all.where(user_id: current_user.id)
    render json: @slills
  end

  def create
    @slill = Slill.new(skill_params)
    if @slill.save
      render json: @skill
    else
      render json: @slill.errors
    end
  end

  def destroy
    @slill = Slill.find(params[:id])
    @slill.destroy
    render json: @skill
  end

  private
  def skill_params
    params.require(:slill).permit(:name).merge(user_id: current_user.id)
  end
end
