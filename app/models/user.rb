class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :clinic, optional: true
  belongs_to :lab, optional: true

  # Userを通じて Clinic を保存できるようにする
  accepts_nested_attributes_for :clinic

  validate :must_belong_to_either_clinic_or_lab

  private

  # 医院と技工所のどちらにも属していないアカウントの発生防止
  def must_belong_to_either_clinic_or_lab
    if clinic.blank? && lab.blank?
      errors.add(:base, "歯科医院または技工所のどちらかに所属する必要があります")
    end  
  end
end
