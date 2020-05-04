class UsersController < ApplicationController
  before_action :when_no_current_user, only: [:show, :edit,:likes]
  def show
    @user = User.find_by(id: params[:id])
    @tweets = @user.tweets 
    @likes = Like.where(user_id: @user.id)
  end

  def edit
    @user = User.find_by(id:params[:id])
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
