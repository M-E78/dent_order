class LabOrder < ApplicationRecord
  belongs_to :patient
  belongs_to :user, optional: true

  # 複数選択のチェックボックスデータを配列として保存・取得する
  serialize :prosthesis_types, coder: JSON
  serialize :prep_items, coder: JSON

  # 製作物リスト
  MENU_ITEMS = [ "インレー", "FMC", "CAD/CAMインレー", "CAD/CAM冠", "硬質レジン前装冠", "PFM", "ブリッジ", "e.max", "ジルコニア", "PFM", "インプラント上部構造" ].freeze
  enum :jaw_type, { upper: 0, lower: 1, both: 2 }
  # ステータスを「0: 未着手, 1: 製作中, 2: 完了」などで管理できるようにする
  enum :status, { pending: 0, processing: 1, completed: 2 }

  # status の中身を見て日本語を返すメソッド
  def status_text
    case status
    when "pending"   then "未着手"
    when "processing" then "製作中"
    when "completed" then "完了"
    else "不明"
    end
  end

  # 歯式を配列として扱う
  def selected_teeth_list
    tooth_numbers.to_s.split(",")
  end
end
