class AddUserIdToLabOrders < ActiveRecord::Migration[7.2]
  def change
    add_reference :lab_orders, :user, null: true, foreign_key: true
  end
end
