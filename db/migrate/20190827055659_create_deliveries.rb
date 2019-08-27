class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id
      t.integer :postal_code
      t.string :prefecture
      t.string :city
      t.string :street_address
      t.string :building_name, :default => ''

      t.timestamps
    end
  end
end
