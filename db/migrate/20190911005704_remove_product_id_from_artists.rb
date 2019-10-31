class RemoveProductIdFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :product_id, :integer
  end
end
