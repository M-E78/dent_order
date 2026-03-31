class Profiles::TwoFactorAuthsController < ApplicationController
  before_action :authenticate_user!

  def show
    # 二段階認証が未有効な場合のみ、一時的に秘密鍵をセットしてQR表示
    unless current_user.otp_required_for_login
      # まだ秘密鍵がない（nil）場合のみ生成
      current_user.otp_secret = User.generate_otp_secret if current_user.otp_secret.blank?
      current_user.save!
    end

    @uri = current_user.otp_provisioning_uri(current_user.email, issuer: "Dent-Order")
    @qrcode = RQRCode::QRCode.new(@uri).as_svg(module_size: 4)
  end

  def create
    # 重要：一度だけ otp_secret を保存してから検証する
    # ※今の時点ではまだ otp_required_for_login は false のまま
    if current_user.validate_and_consume_otp!(params[:otp_attempt])
      current_user.otp_required_for_login = true
      current_user.save!
      redirect_to profiles_two_factor_auth_path, notice: "二段階認証を有効にしました。"
    else
      flash.now[:alert] = "認証コードが正しくありません。もう一度お試しください。"
      # エラー時は再表示のためにQRコードを再生成
      @uri = current_user.otp_provisioning_uri(current_user.email, issuer: "Dent-Order")
      @qrcode = RQRCode::QRCode.new(@uri).as_svg(module_size: 4)
      render :show, status: :unprocessable_entity
    end
  end
end
