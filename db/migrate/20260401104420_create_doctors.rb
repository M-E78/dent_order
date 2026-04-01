class CreateDoctors < ActiveRecord::Migration[7.2]
  def change
    create_table :doctors do |t|
      t.references :clinic, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
