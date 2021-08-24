Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items
  resources :bookings, only: [:new, :create, :index, :show]
end
