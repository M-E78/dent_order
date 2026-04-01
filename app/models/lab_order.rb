class LabOrder < ApplicationRecord
  belongs_to :patient

  # ステータスを「0: 未着手, 1: 製作中, 2: 完了」などで管理できるようにします
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
end
