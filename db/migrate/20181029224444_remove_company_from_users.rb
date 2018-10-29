class RemoveCompanyFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :company, :string
  end
end
