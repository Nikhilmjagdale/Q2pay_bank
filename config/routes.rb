Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  post 'bank_accounts/:id/add_money', to: 'bank_accounts#add_money', as: 'bank_account_add_money'
  resources :bank_accounts
end
