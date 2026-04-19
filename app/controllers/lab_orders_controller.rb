class LabOrdersController < ApplicationController
  # analyze_voiceアクションだけCSRFチェックを外す
  protect_from_forgery with: :null_session, only: [ :analyze_voice ]

  before_action :set_patient, only: [ :new, :create ]

  def new
    # 1回だけbuildし、同時に初期値（今日の日付）をセット
    @lab_order = @patient.lab_orders.build(order_date: Date.current)
    # ログインユーザーの名前をデフォルト値としてセット
    @lab_order.doctor_name = current_user.name
  end

  def create
    @lab_order = @patient.lab_orders.build(lab_order_params)
    if @lab_order.save
      redirect_to root_path, notice: "指示書を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def analyze_voice
    # ブラウザから送られてきたテキストを取得
    text = params[:text]

    if text.present?
      # 昨日作った Service を呼び出して解析！
      parser = OpenaiParserService.new(text)
      result = parser.parse

      # 解析結果（JSON）をそのままブラウザ（JS）に返す
      render json: result
    else
      render json: { error: "テキストが空です" }, status: :bad_request
    end
  end

  private

  def set_patient
    @patient = current_user.clinic.patients.find(params[:patient_id])
  end

  def lab_order_params
  params.require(:lab_order).permit(
    :order_date,          # 発行日
    :set_date,            # セット日
    :tooth_numbers,       # 部位（歯の番号）
    :user_id,             # 担当Dr
    :material,
    :metal_type,          # 使用金属
    :shade,               # シェード
    :pontic_form,         # ポンティック
    :metal_type,          # 義歯の金属
    :treatment_details,   # 備考
    prosthesis_types: [], # 製作物（重要：配列なので [] が必要！）
    prep_items: []        # 準備物（同様に [] が必要！）
  )
  end
end
