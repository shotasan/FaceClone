class SessionsController < ApplicationController
  def new
  end

  def create
    # sessions/new/html.erbで入力されたemailが正しいかどうか
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログインしたユーザのidをセッションに保存
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:danger] = "ログインに失敗しました"   
      redirect_to "/"
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to "/"
  end
end
