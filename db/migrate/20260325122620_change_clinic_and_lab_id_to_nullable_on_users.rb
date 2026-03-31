class ChangeClinicAndLabIdToNullableOnUsers < ActiveRecord::Migration[7.2]
  def change
    # null: false を false にする（空を許可する）
    change_column_null :users, :clinic_id, true
    change_column_null :users, :lab_id, true
  end
end
