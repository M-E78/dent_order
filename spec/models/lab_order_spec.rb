require 'rails_helper'

RSpec.describe LabOrder, type: :model do
  describe 'メソッドのテスト' do
    # 1. 正常系
    it 'ステータスがpendingの場合、status_textが「未着手」を返すこと' do
      lab_order = LabOrder.new(status: 'pending')
      expect(lab_order.status_text).to eq '未着手'
    end

    # 2. 正常系
    it 'ステータスがprocessingの場合、status_textが「製作中」を返すこと' do
      lab_order = LabOrder.new(status: 'processing')
      expect(lab_order.status_text).to eq '製作中'
    end

    # 3. 正常系
    it 'tooth_numbersがカンマ区切りの文字列の場合、selected_teeth_listが配列を返すこと' do
      lab_order = LabOrder.new(tooth_numbers: '11,12,13')
      expect(lab_order.selected_teeth_list).to eq [ '11', '12', '13' ]
    end
  end

  # 4. 異常系
  describe 'バリデーションのテスト' do
    it '患者（patient）が紐付いていない場合は無効であること' do
      lab_order = LabOrder.new(patient: nil, status: 'pending')
      expect(lab_order).not_to be_valid
    end
  end
end
