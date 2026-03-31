class AddDetailsToOrganizations < ActiveRecord::Migration[7.2]
  def change
    # 医院テーブルに追加
    add_column :clinics, :postal_code, :string unless column_exists?(:clinics, :postal_code)
    add_column :clinics, :address, :string     unless column_exists?(:clinics, :address)
    add_column :clinics, :phone_number, :string unless column_exists?(:clinics, :phone_number)

    # 技工所テーブルに追加
    add_column :labs, :postal_code, :string    unless column_exists?(:labs, :postal_code)
    add_column :labs, :address, :string        unless column_exists?(:labs, :address)
    add_column :labs, :phone_number, :string    unless column_exists?(:labs, :phone_number)
  end
end
