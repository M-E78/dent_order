class AddPonticFormToLabOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :lab_orders, :pontic_form, :string
  end
end
