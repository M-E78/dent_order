class Users::SessionsController < Devise::SessionsController
  def create
    # 1. まずはIDとパスワードでユーザーを探す
    self.resource = warden.authenticate!(auth_options)

    # 2. もし二段階認証が「有効」なら、一旦ログアウトさせてコード入力画面へ
    if resource.otp_required_for_login
      # まだログインさせない（サインアウト状態にする）
      sign_out(resource)
      # ユーザーIDを一時的にセッションに保存（後で誰のコードか判別するため）
      session[:otp_user_id] = resource.id
      # 2FA入力画面へリダイレクト
      redirect_to new_user_otp_path
    else
      # 二段階認証がOFFなら、そのまま普通にログイン
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end
end
