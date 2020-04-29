class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @tweets = @user.tweets
  end

  def edit
    @user = User.find_by(id:params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
