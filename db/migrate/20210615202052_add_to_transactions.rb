class AddToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :remaining_balance, :integer
  end
end
