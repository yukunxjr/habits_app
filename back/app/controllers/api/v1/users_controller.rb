class Api::V1::UsersController < ApplicationController
   before_action :authenticate_user!
  def index

  end

  def new
    @user = current_user
    render json: @user
  end
end
