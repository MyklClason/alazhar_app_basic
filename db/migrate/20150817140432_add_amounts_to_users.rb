class AddAmountsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_investment, :integer, :default => 0
  end
end
