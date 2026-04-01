class Patient < ApplicationRecord
  belongs_to :clinic
  # 患者が消えたら、その人の指示書も一緒に消える設定
  has_many :lab_orders, dependent: :destroy
end
