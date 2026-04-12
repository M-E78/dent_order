class OtpsController < ApplicationController
  # 1. ログイン前なので、ログイン必須チェックを外す
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  # 2. プロフィール登録チェックも、認証が終わるまでは外す
  # raise: false をつけておくと、万が一設定がなくてもエラーにならない
  skip_before_action :check_profile_completion, only: [ :new, :create ], raise: false

  def new
    redirect_to new_user_session_path if session[:otp_user_id].blank?
  end

  def create
    user = User.find(session[:otp_user_id])

    if user.validate_and_consume_otp!(params[:otp_attempt])
      session.delete(:otp_user_id)
      sign_in(user)
      redirect_to root_path, notice: "ログインしました！"
    else
      flash.now[:alert] = "認証コードが正しくありません。"
      render :new, status: :unprocessable_entity
    end
  end
end
