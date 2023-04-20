class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
  end

  def new
    
  end

  private

  def user_params
    params.permit(:name)
  end
end
