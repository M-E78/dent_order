class DoctorsController < ApplicationController
  def index
    # ログインユーザーの医院に属するドクターだけを取得
    @doctors = current_user.clinic.doctors
    @doctor = Doctor.new
  end

  def create
    @doctor = current_user.clinic.doctors.build(doctor_params)
    if @doctor.save
      redirect_to doctors_path, notice: "ドクターを登録しました。"
    else
      @doctors = current_user.clinic.doctors
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    doctor = current_user.clinic.doctors.find(params[:id])
    doctor.destroy
    redirect_to doctors_path, notice: "ドクターを削除しました。", status: :see_other
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name)
  end
end