class TweetsController < ApplicationController
  before_action :move_to_sign_in, except: [:show, :index]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweets_params)
    if @tweet.save
      redirect_to(tweets_path)
    else
      flash.now[:notice] = "保存できませんでした"
      render(new_tweet_path)
    end
  end

  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  def edit
  end

  def destroy
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to(root_path)
  end

  private
  def tweets_params
    params.require(:tweet).permit(:text).merge(user_id:current_user.id)
  end

  def move_to_sign_in
    redirect_to root_path unless :user_signed_in?
  end
end
