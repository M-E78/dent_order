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

  def edit
  end

  def update
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :name_kana, :chart_number, :birth_date, :gender)
  end
end
