class CreateProductAritists < ActiveRecord::Migration[5.2]
  def change
    create_table :product_aritists do |t|
      t.integer :product_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
