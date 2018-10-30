class ChangePlantOwnershipToPlant < ActiveRecord::Migration[5.2]
  def change
    rename_table :plant_ownerships, :plants
  end
end
