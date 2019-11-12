json.extract! my_wallet, :id, :user_id, :balance, :created_at, :updated_at
json.url my_wallet_url(my_wallet, format: :json)
