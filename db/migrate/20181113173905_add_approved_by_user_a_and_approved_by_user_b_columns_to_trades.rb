class AddApprovedByUserAAndApprovedByUserBColumnsToTrades < ActiveRecord::Migration[5.2]
  def change
      add_column :trades, :approved_by_user_a, :boolean, default: false, null: false
      add_column :trades, :approved_by_user_b, :boolean, default: false, null: false
  end
end
