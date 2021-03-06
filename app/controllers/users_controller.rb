class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # new.html.erbから受け取ったパラメーターでインスタンスを作成
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    # new.html.erbからパラメーターを受ける
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
