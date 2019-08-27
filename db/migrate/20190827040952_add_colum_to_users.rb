class AddColumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :tell, :string
    add_column :customers, :birthday, :string
    add_column :customers, :customer_postal_code, :integer
    add_column :customers, :customer_prefecture, :string
    add_column :customers, :customer_city, :string
    add_column :customers, :customer_street_address, :string
    add_column :customers, :customer_building_name, :string, :default => ''
    add_column :customers, :delete_at, :datetime
    add_index :customers, :deleted_at
  end
end
