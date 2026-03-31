class Lab < ApplicationRecord
has_many :users, dependent: :destroy

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
