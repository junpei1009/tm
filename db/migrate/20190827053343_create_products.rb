class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :format
      t.string :title
      t.integer :stock
      t.string :status
      t.integer :price

      t.timestamps
    end
  end
end
