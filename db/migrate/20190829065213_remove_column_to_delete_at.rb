class RemoveColumnToDeleteAt < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :delete_at, :datetime
  end
end
