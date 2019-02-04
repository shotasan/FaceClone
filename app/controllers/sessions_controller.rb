class SessionsController < ApplicationController
  def new
  end

  def create
    # sessions/new/html.erbで入力されたemailが正しいかどうか
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    else
      flash.now[:danger] = "ログインに失敗しました"
      render "new"
    end
  end
end
