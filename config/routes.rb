Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items, except: :new do
    resources :bookings, only: %i[show create update destroy]
  end
  resources :bookings, only: :show
  get 'account/:id/listings', to: 'pages#listings', as: :listings
  get 'account/:id/purchases', to: 'pages#purchases', as: :purchases
  get 'account/:id/settings', to: 'pages#settings', as: :settings
  get 'about', to: 'pages#about', as: :about
  get 'team', to: 'pages#team', as: :team
end
