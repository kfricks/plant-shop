class CreateTradeComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_components do |t|
      t.integer :trade_id
      t.integer :plant_ownership_id

      t.timestamps
    end
  end
end
