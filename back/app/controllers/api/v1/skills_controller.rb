class Api::V1::SkillsController < ApplicationController
  before_action :authenticate_user!
  def index
    @skills = Skill.all.where(user_id: current_user.id)
    render json: @skills
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      render json: @skill
    else
      render json: @skill.errors
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    render json: @skill
  end

  private
  def skill_params
    params.require(:skill).permit(:name).merge(user_id: current_user.id)
  end
end
