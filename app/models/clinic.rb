class Clinic < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :patients, dependent: :destroy
  # 医院を通じてユーザーを保存できるようにする
  accepts_nested_attributes_for :users

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
