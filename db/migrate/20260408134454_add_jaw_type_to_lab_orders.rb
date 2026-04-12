class AddJawTypeToLabOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :lab_orders, :jaw_type, :integer
  end
end
