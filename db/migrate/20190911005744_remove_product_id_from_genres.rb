class RemoveProductIdFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :product_id, :integer
  end
end
