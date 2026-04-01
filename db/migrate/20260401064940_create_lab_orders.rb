class CreateLabOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :lab_orders do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :doctor_name
      t.string :menu_name
      t.string :material
      t.string :shade
      t.date :order_date
      t.date :set_date
      t.text :notes
      t.integer :status

      t.timestamps
    end
  end
end
