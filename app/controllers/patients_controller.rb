class PatientsController < ApplicationController
  def index
  end

  def new
    # 「これから作る患者」のインスタンスを生成
    @patient = current_user.clinic.patients.build
  end

  def create
    @patient = current_user.clinic.patients.build(patient_params)
    if @patient.save
      # 保存できたら指示書作成画面（lab_orders/new）へ飛ばす
      redirect_to new_patient_lab_order_path(@patient), notice: "患者を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @patient = current_user.clinic.patients.find(params[:id])
    # この患者さんに紐づく指示書を新しい順にすべて取得
    @lab_orders = @patient.lab_orders.order(created_at: :desc)
  end

  def destroy
    # 他の病院の患者を消さないよう、current_user.clinic 経由で探す
    @patient = current_user.clinic.patients.find(params[:id])

    if @patient.destroy
      redirect_to root_path, notice: "患者データを削除しました。", status: :see_other
    else
      redirect_to root_path, alert: "削除に失敗しました。", status: :see_other
    end
  end

  def edit
    @patient = current_user.clinic.patients.find(params[:id])
  end

  def update
    @patient = current_user.clinic.patients.find(params[:id])
    if @patient.update(patient_params)
      redirect_to patient_path(@patient), notice: "患者情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :name_kana, :chart_number, :birth_date, :gender)
  end
end
