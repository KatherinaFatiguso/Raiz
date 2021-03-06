class MyWallet < ApplicationRecord
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  validates :balance, numericality: { greater_than_or_equal_to: 0, message: "Balance must be non-negative." }
end
