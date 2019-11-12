class SetDefaultValueToMyWallets < ActiveRecord::Migration[6.0]
  def change
    change_column :my_wallets, :balance, :decimal, default: 0.0, precision: 10, scale: 2
  end
end
