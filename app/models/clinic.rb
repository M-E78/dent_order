class Clinic < ApplicationRecord
  has_many :users, dependent: :destroy

  # 医院を通じてユーザーを保存できるようにする
  accepts_nested_attributes_for :users

  validates :name, presence: true
end
