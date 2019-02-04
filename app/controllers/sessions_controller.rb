class SessionsController < ApplicationController
  def new
  end

  def create
    # sessions/new/html.erbで入力されたemailが正しいかどうか
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログインしたユーザのidをセッションに保存
      session[:user_id] = user.id
      # 詳細画面へ
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = "ログインに失敗しました"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to new_session_path
  end
end
