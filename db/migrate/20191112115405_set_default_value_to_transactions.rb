class SetDefaultValueToTransactions < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :amount, :decimal, default: 0.0, precision: 10, scale: 2
  end
end
