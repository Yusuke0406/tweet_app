class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to tweet_path(params[:tweet_id])
    else
      flash[:notice] = "保存できませんでした"
      redirect_to tweet_path(params[:tweet_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id:@current_user.id, tweet_id: params[:tweet_id])
  end
end
