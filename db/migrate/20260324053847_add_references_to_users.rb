class AddReferencesToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :clinic, null: false, foreign_key: true
    add_reference :users, :lab, null: false, foreign_key: true
  end
end
