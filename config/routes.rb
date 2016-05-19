Rails.application.routes.draw do
  root to: 'products#index'

  resources :products
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

end
