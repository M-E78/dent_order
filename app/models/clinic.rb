class Clinic < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :doctors, dependent: :destroy

  # 医院を通じてユーザーを保存できるようにする
  accepts_nested_attributes_for :users

  validates :name, presence: true
  validates :postal_code, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :phone_number, presence: true, on: :update
end
