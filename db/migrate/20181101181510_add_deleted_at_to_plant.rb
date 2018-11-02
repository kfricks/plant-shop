class AddDeletedAtToPlant < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :deleted_at, :datetime
    add_index :plants, :deleted_at
  end
end
