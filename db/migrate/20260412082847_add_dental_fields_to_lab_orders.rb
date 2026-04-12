class AddDentalFieldsToLabOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :lab_orders, :tooth_numbers, :string
    add_column :lab_orders, :treatment_details, :string
    add_column :lab_orders, :prosthesis_types, :text
    add_column :lab_orders, :prep_items, :text
  end
end
