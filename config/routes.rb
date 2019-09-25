Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :destroy]

  resources :events, only: [:new, :create, :index, :show]
  root to: 'events#index'
end
