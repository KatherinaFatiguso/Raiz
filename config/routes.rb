Rails.application.routes.draw do
  root to: 'pages#home'
  resources :transactions
  resources :my_wallets
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'find_users', to: 'pages#find_users'
end
