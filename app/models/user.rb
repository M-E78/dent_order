class User < ApplicationRecord
  attr_accessor :clinic_name, :lab_name

  devise :two_factor_authenticatable,
         :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         otp_secret_encryption_key: ENV["OTP_SECRET_ENCRYPTION_KEY"]

  belongs_to :clinic, optional: true
  belongs_to :lab, optional: true

  accepts_nested_attributes_for :clinic

  validates :name, presence: true
  validate :must_belong_to_either_clinic_or_lab

  enum :role, { admin: 0, doctor: 1 }

  # 🌟 順番を整理：まずは所属先を作り、その後に2FAを設定する
  before_validation :build_clinic_or_lab, on: :create
  before_validation :set_default_2fa, on: :create

  private

  def build_clinic_or_lab
    # 🌟 clinic_name が入力されている場合
    if clinic_name.present?
      if clinic.present?
        # すでに空の箱がある場合は、その箱に名前を入れる
        clinic.name = clinic_name
      else
        # 箱がなければ新しく作る
        self.build_clinic(name: clinic_name)
      end
    # 🌟 lab_name が入力されている場合
    elsif lab_name.present?
      if lab.present?
        lab.name = lab_name
      else
        self.build_lab(name: lab_name)
      end
    end
  end

  def set_default_2fa
    # 🌟 安全のため、新規登録時は一貫して false (OFF) に設定します
    # これにより「締め出し」を防ぎ、ログイン後にバナーから設定してもらうフローにします
    self.otp_required_for_login = false if self.otp_required_for_login.nil?
  end

  def must_belong_to_either_clinic_or_lab
    # Clinicオブジェクトが存在し、かつ名前が入っているかを確認
    if (clinic.blank? || clinic.name.blank?) && (lab.blank? || lab.name.blank?)
      errors.add(:base, "歯科医院または技工所のどちらかに所属する必要があります")
    end
  end
end
