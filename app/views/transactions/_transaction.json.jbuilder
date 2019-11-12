json.extract! transaction, :id, :name, :user_id, :source_wallet, :target_wallet, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
