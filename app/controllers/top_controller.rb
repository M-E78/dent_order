class TopController < ApplicationController
  def index
    # ログインしているのが医院（Clinic）の場合だけ、その医院の患者一覧を取得
    if current_user.clinic.present?
      @patients = current_user.clinic.patients
    else
      @patients = []
    end
  end
end
