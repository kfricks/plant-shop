class ChangeTradesStatusDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :trades, :status, from: nil, to: 'pending'
  end
end
