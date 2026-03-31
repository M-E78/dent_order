class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_profile_completion

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  # ログアウトした後のリダイレクト先を指定する
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # ログイン画面へ飛ばす
  end

  def check_profile_completion
    # ログインしていない、またはDevise関連の画面（ログイン画面など）ならチェックしない
    return unless user_signed_in?
    # Deviseのコントローラーや、プロフィール編集画面そのものにいる時はスキップ（無限ループ防止）
    return if devise_controller? || request.path.include?("/profiles")


    # organization を定義
    organization = current_user.clinic || current_user.lab

    # 所属先がない、または住所・電話番号が空の場合
    if organization.nil? || organization.address.blank? || organization.phone_number.blank?
      redirect_to edit_profile_path, alert: "サービス利用前に詳細情報を入力してください。"
    end
  end
end
