class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :payment
      t.string :shipping_address
      t.string :delivery_status
      t.integer :subtotal_amount
      t.integer :total_amount
      t.integer :postage
      t.integer :consumption_tax

      t.timestamps
    end
  end
end
