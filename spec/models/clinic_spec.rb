require 'rails_helper'

RSpec.describe Clinic, type: :model do
  describe 'バリデーションのテスト' do
    # 1. 正常系
    it '医院名がある場合は有効であること' do
      clinic = Clinic.new(name: '鈴木歯科医院')
      expect(clinic).to be_valid
    end

    # 2. 異常系
    it '医院名がない場合は無効であること' do
      clinic = Clinic.new(name: nil)
      expect(clinic).not_to be_valid
      expect(clinic.errors[:name]).to include('を入力してください')
    end
  end
end
