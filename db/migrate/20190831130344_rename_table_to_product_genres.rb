class RenameTableToProductGenres < ActiveRecord::Migration[5.2]
  def change
    rename_table :product_genres, :Genre_products
  end
end
