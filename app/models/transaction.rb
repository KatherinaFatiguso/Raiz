class Transaction < ApplicationRecord
  belongs_to :user
  validates :amount, numericality: { greater_than_or_equal_to: 0, message: "Amount must be non-negative." }
end
