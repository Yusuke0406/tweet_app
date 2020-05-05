class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: @current_user.id, tweet_id: params[:tweet_id])
    @like.save
    respond_to do |format|
      format.html{redirect_to tweet_path(params[:tweet_id])}
      format.json{render json: @like}
    end
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, tweet_id: params[:tweet_id])
    @like.destroy
    redirect_to tweet_path(params[:tweet_id])
  end


end
