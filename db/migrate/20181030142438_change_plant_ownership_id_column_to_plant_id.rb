class ChangePlantOwnershipIdColumnToPlantId < ActiveRecord::Migration[5.2]
  def change
    rename_column :trade_components, :plant_ownership_id, :plant_id
  end
end
