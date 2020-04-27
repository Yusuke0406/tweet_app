class UsersController < ApplicationController
  def show
    @tweets = @user.tweets
  end
end
