Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'account/:id', to: 'pages#account', as: :account
  resources :items
  resources :bookings, only: %i[new create index show]
end
