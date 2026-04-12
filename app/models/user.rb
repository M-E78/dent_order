class User < ApplicationRecord
  # 新規登録フォームから「歯科医院名」や「技工所名」を受け取るための一時的な入れ物
  attr_accessor :clinic_name, :lab_name

  devise :two_factor_authenticatable,
         :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         otp_secret_encryption_key: ENV["OTP_SECRET_ENCRYPTION_KEY"]

  belongs_to :clinic, optional: true
  belongs_to :lab, optional: true

  # Userを通じて Clinic を保存できるようにする
  accepts_nested_attributes_for :clinic

  # バリデーション
  validates :name, presence: true
  validate :must_belong_to_either_clinic_or_lab

  # 役割を定義（0: 管理者/院長, 1: 勤務医）
  enum :role, { admin: 0, doctor: 1 }

  private

  # 医院と技工所のどちらにも属していないアカウントの発生防止
  def must_belong_to_either_clinic_or_lab
    if clinic.blank? && lab.blank?
      errors.add(:base, "歯科医院または技工所のどちらかに所属する必要があります")
    end
  end
end
