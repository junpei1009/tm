class RenameTablesToArtist < ActiveRecord::Migration[5.2]
  def change
    rename_table :product_aritists, :artist_products
  end
end
