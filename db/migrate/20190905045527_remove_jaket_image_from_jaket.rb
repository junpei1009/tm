class RemoveJaketImageFromJaket < ActiveRecord::Migration[5.2]
  def change
    remove_column :jakets, :jaket_image, :string
    add_column :jakets, :image_id, :string
  end
end
