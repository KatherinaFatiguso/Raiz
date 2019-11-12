Rails.application.routes.draw do
  resources :transactions
  resources :my_wallets
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
