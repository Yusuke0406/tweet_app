class UsersController < ApplicationController
  def show
    @user =　User.find_by(params[:id])
    @tweets = @user.tweets
  end
end
