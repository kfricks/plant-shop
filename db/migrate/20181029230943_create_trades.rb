class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.integer :user_a
      t.integer :user_b
      t.string :shipping_label_user_a
      t.string :shipping_label_user_b
      t.string :status

      t.timestamps
    end
  end
end
