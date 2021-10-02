Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :portfolios, :payments, :wallets, :stocks

  get '/payments/:id/:transaction_type/buy' => 'payments#buy', as: "payment_buy" # yung name before 'controller' lang, snake case, then #, then saang action or method pupunta(index)
  get '/payments/:id/:transaction_type/sell' => 'payments#sell', as: "payment_sell" # yung name before 'controller' lang, snake case, then #, then saang action or method pupunta(index)

  # get '/admins/dashboard', to: 'admins#dashboard' 
  get '/admins/dashboard', to: 'admins#dashboard' 
  put '/admins/approve_users/:id', to: 'admins#approve_users', as: :approve_user
  get '/admins/new_user', to: 'admins#new_user'
  post '/admins/new_user', to: 'admins#create_user'
  get '/admins/approved_users/:id', to: 'admins#show_user', as: :show_profile
  put '/admins/approved_users/:id', to: 'admins#modify_user'
  patch '/admins/approved_users/:id', to: 'admins#modify_user'
  get '/admins/approved_users/:id/edit', to: 'admins#edit_user', as: :edit_user_profile
  get '/admins/all_transactions', to: 'admins#all_transactions', as: :user_transactions
  
end
