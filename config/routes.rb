Rails.application.routes.draw do
  root to: 'products#index'

  resources :products do
    resources :reviews, only: [:show, :create, :destroy, :edit, :update,]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

end
