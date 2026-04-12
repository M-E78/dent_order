class DoctorsController < ApplicationController
def index
    # 1. 医院に属する「自分以外のドクターユーザー」を取得
    # role: :doctor のユーザーだけを表示します
    @doctors = current_user.clinic.users.doctor.where.not(id: current_user.id)

    # 2. フォーム用の空オブジェクト（User）を用意
    @new_doctor = User.new
  end

  def create
    # 3. Userモデルとして作成
    @new_doctor = current_user.clinic.users.build(doctor_params)

    # 4. 明示的に「ドクター」権限を与え、仮パスワードを設定
    @new_doctor.role = :doctor
    @new_doctor.password = "password123" # MVP用：本人が後で変更する運用

    if @new_doctor.save
      redirect_to doctors_path, notice: "#{@new_doctor.name}先生のアカウントを作成しました（初期パスワード: password123）"
    else
      @doctors = current_user.clinic.users.doctor.where.not(id: current_user.id)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    # 5. Userの中から、自分の医院のドクターを探して削除
    doctor = current_user.clinic.users.doctor.find(params[:id])
    doctor.destroy
    redirect_to doctors_path, notice: "ドクターのアカウントを削除しました。", status: :see_other
  end

  private

  def doctor_params
    # 🌟 Userモデルに保存するので、require(:user) になります
    params.require(:user).permit(:name, :email)
  end
end
