class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :number
      t.integer :price

      t.timestamps
    end
  end
end
