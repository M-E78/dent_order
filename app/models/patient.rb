class Patient < ApplicationRecord
  belongs_to :clinic
  # 患者が消えたら、その人の指示書も一緒に消える設定
  has_many :lab_orders, dependent: :destroy

  validates :name, presence: true
  validates :chart_number, uniqueness: { scope: :clinic_id }, allow_blank: true
  #　uniquenessに { scope: :clinic_id } をつけることで、
  # 「他の医院には同じカルテ番号の人がいても良いが、同じ医院内では重複を許さない」という実務に即した仕様になる。
end
