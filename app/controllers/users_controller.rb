class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @tweets = @user.tweets
  end

  def edit
    @user = User.find_by(id:params[:id])
  end

  def update
    @user = User.find_by(id:params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.image = params[:image]
    # @user.password = params[:password]
    if @user.save
      flash[:notice] = "変更できました。"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "変更できませんでした"
      rendedr edit_user_path(@user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
