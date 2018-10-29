class CreatePlantOwnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :plant_ownerships do |t|
      t.integer :user_id
      t.integer :plant_type_id

      t.timestamps
    end
  end
end
