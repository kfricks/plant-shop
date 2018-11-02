class RenameUserABtoUserAbIdOnTrades < ActiveRecord::Migration[5.2]
  def change
    rename_column :trades, :user_a, :user_a_id
    rename_column :trades, :user_b, :user_b_id
  end
end
