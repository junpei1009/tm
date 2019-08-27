class CreateJakets < ActiveRecord::Migration[5.2]
  def change
    create_table :jakets do |t|
      t.integer :product_id
      t.string :jaket_image

      t.timestamps
    end
  end
end
