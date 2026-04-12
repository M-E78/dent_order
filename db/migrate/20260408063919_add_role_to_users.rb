class AddRoleToUsers < ActiveRecord::Migration[7.2]
  def change
    # default: 0 (admin/院長) を追加することで、既存のユーザーもエラーにならない
    add_column :users, :role, :integer, default: 0
  end
end
