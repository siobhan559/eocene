Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'account/:id/listings', to: 'pages#listings', as: :listings
  get 'account/:id/purchases', to: 'pages#purchases', as: :purchases
  get 'account/:id/settings', to: 'pages#settings', as: :settings
  resources :items
  resources :bookings, only: %i[show create update destroy]
end
