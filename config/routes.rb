Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :portfolios, :payments, :wallets, :stocks

  get '/payments/:id/buy' => 'payments#buy', as: "payment_buy_path" # yung name before 'controller' lang, snake case, then #, then saang action or method pupunta(index)
  get '/payments/:id/sell' => 'payments#sell', as: "payment_sell_path" # yung name before 'controller' lang, snake case, then #, then saang action or method pupunta(index)

end
