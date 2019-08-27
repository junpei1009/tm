class CreateSings < ActiveRecord::Migration[5.2]
  def change
    create_table :sings do |t|
      t.integer :disk_id
      t.string :sing_name
      t.integer :sing_order

      t.timestamps
    end
  end
end
