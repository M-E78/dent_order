class AddMetalTypeToLabOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :lab_orders, :metal_type, :string
  end
end
