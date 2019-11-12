class ChangeSourceWalletDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :source_wallet, 'integer USING CAST(source_wallet AS integer)', default: nil
    change_column :transactions, :target_wallet, 'integer USING CAST(target_wallet AS integer)', default: nil
  end
end
