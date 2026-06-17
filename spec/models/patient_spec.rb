require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'バリデーションのテスト' do
    # テスト内で共通して使用するテスト用Clinicをデータベースに作成
    let(:clinic) { Clinic.create(name: 'テスト歯科医院') }

    # 1. 正常系
    it '必要な情報がすべて揃っていれば有効であること' do
      patient = Patient.new(
        clinic: clinic, # 親のデータを紐づける
        name: '山田太郎',
        chart_number: '12345'
      )
      expect(patient).to be_valid
    end

    # 2. 異常系（名前の不備）
    it '名前が空の場合は無効であること' do
      patient = Patient.new(
        clinic: clinic,
        name: nil,
        chart_number: '12345'
      )
      expect(patient).not_to be_valid
      expect(patient.errors[:name]).to include('を入力してください')
    end

    # 3. 異常系（重複）
    it '重複したカルテ番号の場合は無効であること' do
      # 1件目の患者をデータベースに保存
      Patient.create!(clinic: clinic, name: '既存の患者', chart_number: '12345')

      # まったく同じカルテ番号で2件目を生成
      patient = Patient.new(clinic: clinic, name: '新規の患者', chart_number: '12345')
      expect(patient).not_to be_valid
    end
  end
end
