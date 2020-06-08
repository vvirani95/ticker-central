Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources 'ticker'
  # resources 'movers'
  resources :ticker, only: [:index]
  resources :movers, only: [:index]
  root 'movers#index'
end
