class Profiles::TwoFactorAuthsController < ApplicationController
  before_action :authenticate_user!

  def show
    unless current_user.otp_required_for_login
      current_user.otp_secret = User.generate_otp_secret if current_user.otp_secret.blank?
      current_user.save!
    end

    @uri = current_user.otp_provisioning_uri(current_user.email, issuer: "Dent-Order")
    @qrcode = RQRCode::QRCode.new(@uri).as_svg(module_size: 4)
  end

  def create
    if current_user.validate_and_consume_otp!(params[:otp_attempt])
      current_user.otp_required_for_login = true
      current_user.save!
      redirect_to root_path, notice: "二段階認証を有効にしました。"
    else
      flash.now[:alert] = "認証コードが正しくありません。もう一度お試しください。"
      @uri = current_user.otp_provisioning_uri(current_user.email, issuer: "Dent-Order")
      @qrcode = RQRCode::QRCode.new(@uri).as_svg(module_size: 4)
      render :show, status: :unprocessable_entity
    end
  end

  # 二段階認証を解除する処理
  def destroy
    current_user.otp_required_for_login = false
    # 秘密鍵もリセットしておくと、次回設定時に新しくなってより安全です
    current_user.otp_secret = nil

    if current_user.save
      # status: :see_other を付けることで Turbo 環境でも確実にリダイレクトさせる
      redirect_to root_path, notice: "二段階認証を解除しました。", status: :see_other
    else
      redirect_to root_path, alert: "解除に失敗しました。", status: :see_other
    end
  end
end
