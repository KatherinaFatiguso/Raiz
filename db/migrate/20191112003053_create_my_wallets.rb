class CreateMyWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :my_wallets do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :balance

      t.timestamps
    end
  end
end
