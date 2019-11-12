class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :source_wallet
      t.string :target_wallet
      t.decimal :amount

      t.timestamps
    end
  end
end
