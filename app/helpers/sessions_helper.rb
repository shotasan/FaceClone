module SessionsHelper
  def current_user
    # sessions_controller.rbでログインユーザのidをセッションに保存
    # 保存したセッションを元にログインユーザのレコードを取得し@current_userに代入
    # ||=によって、既にログイン済みのユーザーはそのままとなる
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ユーザがログインしていればtrue、そうで無いならfalseを返す
  def logged_in?
    current_user.present?
  end
end
