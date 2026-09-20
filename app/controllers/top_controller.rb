class TopController < ApplicationController
  def index
    # ログインしているのが医院（Clinic）の場合だけ、その医院の患者一覧を取得
    if current_user.clinic.present?
      @patients = current_user.clinic.patients
    else
      @patients = []
    end
  end

  def reset_test_data
    test_user = User.find_by(email: 'test@example.com')

    if test_user&.clinic.present?
      # Clinicに紐づく患者データを全削除
      test_user.clinic.patients.destroy_all

      redirect_to root_path, notice: 'テスト環境の不要なデータを一掃しました！'
    elsif test_user
      redirect_to root_path, alert: 'テストユーザーに紐づく医院情報が見つかりませんでした。'
    else
      redirect_to root_path, alert: 'テストユーザーが見つかりませんでした。'
    end
  end
end
