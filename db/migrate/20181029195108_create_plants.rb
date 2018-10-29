class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :symbol
      t.string :synonym_symbol
      t.string :scientific_name
      t.string :common_name
      t.string :family_common_name
      t.string :duration
      t.string :growth_habit
      t.string :image_gallery
      t.string :active_growth_period
      t.string :growth_rate
      t.string :propogated_by_cuttings

      t.timestamps
    end
  end
end
