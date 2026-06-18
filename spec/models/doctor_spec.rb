require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'バリデーションのテスト' do
    # 1. 異常系
    it '医師名がない場合は無効であること' do
      doctor = Doctor.new(name: nil)
      expect(doctor).not_to be_valid
      expect(doctor.errors[:name]).to include('を入力してください')
    end
  end
end
