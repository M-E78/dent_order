class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.references :clinic, null: false, foreign_key: true
      t.string :name
      t.string :name_kana
      t.string :chart_number
      t.date :birth_date
      t.integer :gender

      t.timestamps
    end
  end
end
