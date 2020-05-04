class TweetsController < ApplicationController
  before_action :when_no_current_user, except: [:index,:show]
  def index
    @tweets = Tweet.all.order(updated_at:"desc").page(params[:page]).per(6)
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
    @likes_count = Like.where(tweet_id: @tweet.id).count
  end

  def edit
    @tweet = Tweet.find_by(id: params[:id])
  end

  def update
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.update(tweets_params)
    if @tweet.save
      flash[:notice] = "編集できました"
      redirect_to root_path
    else
      flash[:notice] = "編集できませんでした"
      render :edit
    end
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

end
