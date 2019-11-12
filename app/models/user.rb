class User < ApplicationRecord
  has_one :my_wallet
  has_many :transactions

  def set_balance(amount)
    self.my_wallet.balance = amount
  end
end
