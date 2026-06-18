class Doctor < ApplicationRecord
  belongs_to :clinic

  validates :name, presence: true
end
