class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # new.html.erbから受け取ったパラメーターでインスタンスを作成
    @user = User.new(user_params)
    if @user.save
    else
      render "new"
    end
  end

  private

  def user_params
    # new.html.erbからパラメーターを受ける
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
