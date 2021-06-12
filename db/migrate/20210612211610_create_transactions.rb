class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :payer_id, null: false
      t.integer :points, null: false
      t.timestamps
    end
  end
end
