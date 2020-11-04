Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources 'ticker'
  # resources 'movers'
  resources :ticker, only: [:index]
  resources :daily_movers, only: [:index]
  resources :movers, only: [:index]
  get 'cryptocurrency', to: 'static_pages#crypto', as: 'crypto'
  get 'news', to: 'static_pages#news', as: 'news'
  root 'movers#index'
end
