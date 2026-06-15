require 'rails_helper'

RSpec.describe LabOrder, type: :model do
  describe 'メソッドのテスト' do
    # 1つ目のテスト
    it 'ステータスがpendingの場合、status_textが「未着手」を返すこと' do
      lab_order = LabOrder.new(status: 'pending')
      expect(lab_order.status_text).to eq '未着手'
    end

    # 2つ目のテスト
    it 'ステータスがprocessingの場合、status_textが「製作中」を返すこと' do
      lab_order = LabOrder.new(status: 'processing')
      expect(lab_order.status_text).to eq '製作中'
    end

    # 3つ目のテスト
    it 'tooth_numbersがカンマ区切りの文字列の場合、selected_teeth_listが配列を返すこと' do
      lab_order = LabOrder.new(tooth_numbers: '11,12,13')
      expect(lab_order.selected_teeth_list).to eq [ '11', '12', '13' ]
    end
  end
end
