class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :plant_types, [:scientific_name, :common_name]
    add_index :plants, [:user_id, :plant_type_id, :description]
    add_index :trade_components, [:trade_id, :plant_id]
    add_index :trades, [:user_a_id, :user_b_id, :status]
    add_index :users, [:first_name, :bio, :city, :state, :locale]
  end
end
