class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @tweets = @user.tweets
  end
end
