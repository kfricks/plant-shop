class CreatePlantTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :plant_types do |t|
      t.string :scientific_name
      t.string :common_name
      t.string :family
      t.string :duration
      t.string :growth_habit
      t.string :growth_period
      t.string :growth_rate

      t.timestamps
    end
  end
end
