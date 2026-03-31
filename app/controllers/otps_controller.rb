class OtpsController < ApplicationController
  # 二段階認証の入力中は、まだ「ログイン完了」前なのでチェックをスキップ
  skip_before_action :authenticate_user!, only: [ :new, :create ]
  skip_before_action :check_profile_completion, only: [ :new, :create ]

  def new
    # セッションにユーザーIDがない（不正なアクセス）なら戻す
    redirect_to new_user_session_path if session[:otp_user_id].blank?
  end

  def create
    user = User.find(session[:otp_user_id])

    # 入力されたコードを検証
    if user.validate_and_consume_otp!(params[:otp_attempt])
      # 検証成功！ここで本当にログインさせる
      session.delete(:otp_user_id) # 用が済んだら消す
      sign_in(user)
      redirect_to root_path, notice: "ログインしました！"
    else
      flash.now[:alert] = "認証コードが正しくありません。"
      render :new, status: :unprocessable_entity
    end
  end
end
